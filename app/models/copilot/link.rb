module Copilot
  class Link < Copilot::Content
    serialize :value, Hash

    def url
      value[:url]
    end

    def content
      value[:content]
    end

    def render(contenteditable=nil, class_names=nil)
      "<a href='#{url}' #{contenteditable} data-copilot-slug='#{slug}' class='copilot-editable #{class_names}'>#{content}</a>".html_safe
    end
  end
end
