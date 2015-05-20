module Copilot
  class Content < ActiveRecord::Base
    validates :slug, presence: true, uniqueness: true
    validates :value, presence: true

    scope :for_page, -> (controller, action) { where("slug LIKE ?", "%#{controller}.#{action}%") }

    def self.new_text(**kwargs)
      Text.new(slug: kwargs[:slug].strip, value: kwargs[:value])
    end

    def self.new_link(**kwargs)
      Link.new(slug: kwargs[:slug].strip, value: {url: kwargs[:url].strip, content: kwargs[:value]})
    end

    # protected
    #   def self.new
    #     super
    #   end

    def self.new_list(**kwargs, &block)
      list = List.new(slug: kwargs[:slug].strip)
      yield(list)

      # value = kwargs[:value].split('*').map { |item| item.strip}


    end

    # def self.new
    #   method_name = "new_#{Copilot::Link.name.split('::')[1].downcase}"
    #   raise "Instantiating with the 'new' method is not allowed, use 'Content.#{method_name}' instead."
    # end

  end
end
