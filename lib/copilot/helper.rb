module Copilot
  module Helper

    def app_name
      Copilot.configuration.app_name
    end

    def copilot_text(slug, options = {}, content = nil, &block)
      text = PageContent.new(contents: @contents).fetch(slug: full_slug(slug), text: content || capture(&block))
      contenteditable = signed_in? ? 'content-editable' : ''
      elem = options[:element] || "div"
      class_names = (options[:class_names] || []).join(' ')
      "<#{elem} #{contenteditable} data-copilot-slug='#{full_slug(slug)}' class='copilot-editable #{class_names}'>#{text}</#{elem}>".html_safe
    end

    def copilot_edit_panel
      if signed_in?
        %Q(
          <header class="control-panel">
            <p>
              <span class="left">
                #{app_name} | CMS
              </span>
              <span>#{link_to('Log Out', '/cms/log_out', class: 'log-out')}</span>
            </p>
          </header>
          <a href="#" class="toggle-control-panel" data-expanded="true">-</a>
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

