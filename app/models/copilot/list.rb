module Copilot
  class List < Copilot::Content
    serialize :value, Hash
    after_initialize :init
    before_save :save_contents

    attr_accessor :signed_in

    def contents
      @contents ||= Content.where("slug LIKE ?", "-#{slug}-%").order("(substring(slug, '[0-9]+'))::int ASC").to_a
    end

    def render(options={})
      elem            = options[:element] || "ul"
      list_elem       = options[:list_element] || "li"
      class_names     = (options[:class_names] || []).join(' ')
      child_options = {
        class_names: options[:child_class_names]
        attributes: options[:child_element_attributes]
      }
      @signed_in = options[:signed_in]
      "<#{elem} data-copilot-slug='#{slug}' data-copilot-id='#{id}' class='#{class_names}'>#{render_contents(list_elem, child_options)}</#{elem}>"
    end

    def add_content(content)
      content.slug = new_slug
      contents << content
      value[content.slug] = { visible: true }
    end

    def remove_content(content)
      value[content.slug] = { visible: false }
    end

    def new_slug
      "-#{slug}-#{new_slug_index}"
    end

    private

      def new_slug_index
        (contents.map { |content| content.slug.split('-')[-1].to_i }.max || 0) + 1
      end

      def render_contents(list_elem, options={})
        class_names = (options[:class_names] || []).join(' ')
        attributes = (options[:attributes] || []).join(' ')
        contents.map { |content| "<#{list_elem} class='#{class_names}' #{attributes}>#{content.render(options)}</#{list_elem}>" }.join
      end

      def save_contents
        contents.each { |content| content.save! }
      end

      # A hack to make sure the object saves for now
      def init
        self.value = { default: "Hello" }
      end
  end
end
