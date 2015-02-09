# This migration comes from copilot (originally 20150208175159)
class CreateCopilotContents < ActiveRecord::Migration
  def change
    create_table :copilot_contents do |t|
      t.string :slug
      t.text :value

      t.timestamps null: false
    end
  end
end
