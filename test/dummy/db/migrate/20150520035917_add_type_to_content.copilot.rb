# This migration comes from copilot (originally 20150519211934)
class AddTypeToContent < ActiveRecord::Migration
  def change
    add_column :copilot_contents, :type, :string
  end
end
