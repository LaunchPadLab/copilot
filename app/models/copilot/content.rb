module Copilot
  class Content < ActiveRecord::Base
    validates :slug, presence: true, uniqueness: true
    validates :value, presence: true

    scope :for_page, -> (controller, action) { where("slug LIKE ?", "%#{controller}.#{action}%") }

  end
end
