module Copilot
  class Text < Copilot::Content
    def render(options={})
      elem            = options[:element] || "div"
      class_names     = (options[:class_names] || []).join(' ')
      contenteditable = options[:contenteditable]
      "<#{elem} #{contenteditable} data-copilot-id='#{id}' data-copilot-slug='#{slug}' class='copilot-editable #{class_names}'>#{value}</#{elem}>".html_safe
    end
  end
end
