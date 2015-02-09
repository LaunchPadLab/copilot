module Copilot
  module Helper
    def copilot_text(slug, content=nil, elem='div', &block)
      text = Content.fetch(full_slug(slug), content || capture(&block))
      contenteditable = params[:copilot_engage] ? 'contenteditable' : ''
      "<#{elem} #{contenteditable} data-copilot-slug='#{full_slug(slug)}' data-copilot-value='#{text}' class='copilot-editable'>#{text}</#{elem}>".html_safe
    end

    def copilot_edit_path
       "editable#{request.path}"
    end

    def link_to_copilot(edit_name='Edit', back_name='Back', html_options={})
      if params[:copilot_engage]
        link_to back_name, :back, html_options.merge(class: 'copilot-back-link')
      else
        link_to edit_name, copilot_edit_path, html_options.merge(class: 'copilot-edit-link')
      end
    end

    private
      def full_slug(slug)
        unless slug.starts_with? "."
          "#{params[:controller]}.#{params[:action]}.#{slug}"
        else
          slug
        end
      end
  end
end

