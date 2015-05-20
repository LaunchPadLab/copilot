module Copilot
  class Link < Copilot::Content
    serialize :value, Hash

    def url
      value[:url]
    end

    def content
      value[:content]
    end

    def render(options)
      class_names = (options[:class_names] || []).join(' ')
      contenteditable = options[:contenteditable]
      "<a href='#{url}' #{contenteditable} data-copilot-slug='#{slug}' class='copilot-editable #{class_names}'>#{content}</a>".html_safe
    end
  end
end
