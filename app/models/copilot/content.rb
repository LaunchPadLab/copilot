module Copilot
  class Content < ActiveRecord::Base

    has_paper_trail if defined?(PaperTrail)

    validates :slug, presence: true, uniqueness: true
    validates :value, presence: true

    scope :for_page, -> (controller, action) { where("slug LIKE ?", "#{controller}.#{action}%") }
    scope :drafts, -> { where(draft: true) }

    def self.new_text(**kwargs)
      Text.new(slug: kwargs[:slug].strip, value: kwargs[:value])
    end

    def self.new_link(**kwargs)
      Link.new(slug: kwargs[:slug].strip, value: {url: kwargs[:url].strip, content: kwargs[:value]})
    end

    def self.new_list(**kwargs)
      List.new(slug: kwargs[:slug].strip)
    end

    def self.import(file_path)
      if File.exist?(file_path)
        file = File.read(file_path)
        json = JSON.parse(file)
        (json["listItems"] || []).each do |parent_item, items|
          items.each do |item|
            slug = Copilot::List.where("slug LIKE ?", "%#{parent_item}%").first.new_slug
            if item["attachment"]
              file = ::File.new(item["attachment"])
              content = Copilot::Content.new(type: "Copilot::#{item['type']}", value: item["value"], slug: slug)
              content.attachment = file
              content.save
            else
              content = Copilot::Content.new(type: "Copilot::#{item['type']}", value: item["value"], slug: slug)
              content.save
            end
          end
        end
      else
        puts "No JSON seed file found for your CMS content."
      end
    end

    def published_version(preview)
      if preview
        self
      else
        if defined?(PaperTrail)
          self.draft ? self.previous_version : self
        else
          self
        end
      end
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

    def file?
      type === "Copilot::File"
    end

  end
end
