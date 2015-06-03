class AddFileFieldsToContent < ActiveRecord::Migration
  def change
    add_column :copilot_contents, :attachment_file_name, :string
    add_column :copilot_contents, :attachment_content_type, :string
  end
end
