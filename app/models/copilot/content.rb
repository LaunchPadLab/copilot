module Copilot
  class Content < ActiveRecord::Base
    validates :slug, presence: true, uniqueness: true

    def self.fetch(slug, value='')
      content = self.find_or_create_by(slug: slug)
      content.update(value: value) unless content.value.present?
      return content.value
    end
  end
end
