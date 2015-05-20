module Copilot
  class Text < Copilot::Content
    def render(elem='div', contenteditable=nil, class_names=nil)
      "<#{elem} #{contenteditable} data-copilot-slug='#{slug}' class='copilot-editable #{class_names}'>#{value}</#{elem}>".html_safe
    end
  end
end
