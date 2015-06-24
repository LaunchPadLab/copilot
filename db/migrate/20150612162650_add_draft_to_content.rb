class AddDraftToContent < ActiveRecord::Migration
  def change
    add_column :copilot_contents, :draft, :boolean
  end
end
