module Copilot
  class List < Copilot::Content
    serialize :value, Hash
    after_initialize :init
    before_save :save_contents

    def contents
      @contents ||= Content.where("slug LIKE ?", "-#{slug}-%").to_a
    end

    def render(options={})
      elem            = options[:element] || "ul"
      class_names     = (options[:class_names] || []).join(' ')
      child_options = {
        element:     options[:child_element] || "li",
        class_names: options[:child_class_names]
      }
      "<#{elem} data-copilot-slug='#{slug}' class='#{class_names}'>#{render_contents(child_options)}</#{elem}>".html_safe
    end

    def add_content(content)
      content.slug = new_slug
      contents << content
      value[content.slug] = { visible: true }
    end

    def remove_content(content)
      value[content.slug] = { visible: false }
    end

    private

      def new_slug
        "-#{slug}-#{new_slug_index}"
      end

      def new_slug_index
        (contents.map { |content| content.slug.split('-')[-1].to_i }.max || 0) + 1
      end

      def render_contents(options={})
        contents
          .select { |content| value[content.slug][:visible] }
          .map { |content| content.render(options) }.join
      end

      def save_contents
        contents.each { |content| content.save! }
      end

      # A hack to make sure the object saves for now
      def init
        self.value ||= {default: nil}
      end
  end
end
