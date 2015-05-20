module Copilot
  module Helper

    def app_name
      Copilot.configuration.app_name
    end

    def copilot_text(slug, content = nil, **options, &block)
      text = Content.new_text(slug: full_slug(slug), value: content || capture(&block))
      copilot_content(text, options)
    end

    def copilot_link(slug, url, content = nil, **options, &block)
      link = Content.new_link(slug: full_slug(slug), value: content || capture(&block), url: url)
      copilot_content(link, options)
    end

    def copilot_list(slug, **options)
      list = Content.new_list(slug: full_slug(slug))
      copilot_content(list, options)
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

      def copilot_content(default_content, options={})
        content = PageContent.fetch_or_create(default_content)
        options.merge!({contenteditable: signed_in? ? 'content-editable' : ''})
        content.render(options)
      end

      def signed_in?
        session[:user_id].present?
      end

      def full_slug(slug)
        unless slug.starts_with? "."
          "#{params[:controller]}.#{params[:action]}.#{slug}"
        else
          slug
        end
      end
  end
end

