module Copilot
  class Content < ActiveRecord::Base
    validates :slug, presence: true, uniqueness: true
    validates :value, presence: true

    scope :for_page, -> (controller, action) { where("slug LIKE ?", "#{controller}.#{action}%") }

    def self.new_text(**kwargs)
      Text.new(slug: kwargs[:slug].strip, value: kwargs[:value])
    end

    def self.new_link(**kwargs)
      Link.new(slug: kwargs[:slug].strip, value: {url: kwargs[:url].strip, content: kwargs[:value]})
    end

    def self.new_list(**kwargs)
      List.new(slug: kwargs[:slug].strip)
    end

    def list?
      type === "Copilot::List"
    end

    def text?
      type === "Copilot::Text"
    end

    def link?
      type === "Copilot::Link"
    end

  end
end
