class AddTypeToContent < ActiveRecord::Migration
  def change
    add_column :copilot_contents, :type, :string
  end
end
