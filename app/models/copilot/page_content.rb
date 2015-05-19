module Copilot
  class PageContent

    attr_accessor :contents

    def initialize(params)
      @contents = params[:contents] || []
    end

    def fetch(params)
      slug = params[:slug]
      value = params[:text]
      selected_content = contents.select { |c| c.slug == slug }
      content = selected_content.any? ? selected_content.first : Content.find_or_create_by(slug: slug)
      content.update(value: value) unless content.value.present?
      content.value
    end

  end
end
