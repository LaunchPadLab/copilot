module Copilot
  class File < Copilot::Content

    has_attached_file :attachment
    validates :attachment, :attachment_presence => true
    do_not_validate_attachment_file_type :attachment

    def url
      attachment.url
    end

    def render(options={})
      class_names = (options[:class_names] || []).join(' ')
      contenteditable = options[:contenteditable]
      "<a href='#{url}' target='_blank' #{contenteditable} data-copilot-id='#{id}' data-copilot-slug='#{slug}' class='copilot-editable #{class_names}'>#{value}</a>".html_safe
    end
  end
end
