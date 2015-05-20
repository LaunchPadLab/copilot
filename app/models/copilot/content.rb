module Copilot
  class Content < ActiveRecord::Base
    validates :slug, presence: true, uniqueness: true
    validates :value, presence: true

    scope :for_page, -> (controller, action) { where("slug LIKE ?", "%#{controller}.#{action}%") }

    def self.new_text(**kwargs)
      Text.new(kwargs)
    end

    def self.new_link(**kwargs)
      Link.new(slug: kwargs[:slug], value: {url: kwargs[:url], content: kwargs[:value]})
    end
  end
end
