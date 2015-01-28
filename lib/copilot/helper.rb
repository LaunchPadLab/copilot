module Copilot
  module Helper
    def copilot_text(slug, content=nil, &block)
      foo = nil#ContentStore[slug]
      text = foo || content || capture(&block)
      contenteditable = params[:copilot_engage] ? 'contenteditable' : ''
      "<div #{contenteditable} data-slug='#{full_slug(slug)}'>#{text}</div>".html_safe
    end

    def copilot_path
       request.path.include?('editable') ? request.path : "editable#{request.path}"
    end

    def link_to_copilot(name='Edit', html_options={})
      link_to name, copilot_path, html_options
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

