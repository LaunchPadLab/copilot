module Copilot
  class PageContent

    @contents = {}
    def self.fetch_or_create(default_content)
      slug = default_content.slug

      if slug.starts_with? "."
        namespace = slug
      else
        namespace_parts = slug.split('.')[0..1]
        namespace = namespace_parts.join('.')
        @contents[namespace] = Content.for_page(*namespace_parts).map { |content| [content.slug, content] }.to_h
      end

      unless @contents[namespace][slug]
        default_content.save!
        @contents[namespace][slug] = default_content
      end

      @contents[namespace][slug]
    end

  end
end
