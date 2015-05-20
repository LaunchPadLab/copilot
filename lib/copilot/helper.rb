module Copilot
  module Helper

    def app_name
      Copilot.configuration.app_name
    end

    def copilot_text(slug, content = nil, **options, &block)
      text = Content.new_text(slug: full_slug(slug), value: content || capture(&block))
      content = PageContent.fetch_or_create(text)
      contenteditable = signed_in? ? 'content-editable' : ''
      elem = options[:element] || "div"
      class_names = (options[:class_names] || []).join(' ')
      content.render(elem, contenteditable, class_names)
    end

    def copilot_link(slug, url, content = nil, **options, &block)
      link = Content.new_link(slug: full_slug(slug), value: content || capture(&block), url: url)
      content = PageContent.fetch_or_create(link)
      contenteditable = signed_in? ? 'content-editable' : ''
      class_names = (options[:class_names] || []).join(' ')
      content.render(contenteditable, class_names)
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

