module Copilot
  module Helper

    def app_name
      Copilot.configuration.app_name
    end

    def copilot_text(slug, content=nil, elem='div', &block)
      text = Content.fetch(full_slug(slug), content || capture(&block))
      contenteditable = signed_in? ? 'content-editable' : ''
      "<#{elem} #{contenteditable} data-copilot-slug='#{full_slug(slug)}' data-copilot-value='#{text}' class='copilot-editable'>#{text}</#{elem}>".html_safe
    end

    def copilot_edit_path
     "editable#{request.path}"
    end

    def link_to_copilot(edit_name='Edit', back_name='Back', html_options={})
      if signed_in?
        link_to back_name, :back, html_options.merge(class: 'copilot-back-link')
      else
        link_to edit_name, copilot_edit_path, html_options.merge(class: 'copilot-edit-link')
      end
    end

    def copilot_edit_panel
      if signed_in?
        %Q(
          <header class="control-panel">
            <p>
              <span class="left">#{app_name} | CMS</span>
              <span>Logged in as Admin | #{link_to('Log Out', '/cms/log_out')}</span>
            </p>
          </header>
        ).html_safe
      end
    end

    private
      def signed_in?
        session[:user_id].present?
      end

      def full_slug(slug)
        p request.path.to_s
        unless slug.starts_with? "."
          "#{params[:controller]}.#{params[:action]}.#{slug}"
        else
          slug
        end
      end
  end
end

