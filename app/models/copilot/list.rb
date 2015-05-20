module Copilot
  class List < Copilot::Content
    serialize :value, Array

    def content
      Content.where(slug: value)
    end

    def render(options)
      elem            = options[:element] || "ul"
      class_names     = (options[:class_names] || []).join(' ')
      child_options = {
        element:     options[:child_element] || "li",
        class_names: options[:child_class_names]
      }
      "<#{elem} data-copilot-slug='#{slug}' class='#{class_names}'>#{render_content(child_options)}</#{elem}>".html_safe
    end

    def render_content(options)
      content.map { |item| item.render(options) }.join
    end
  end
end
