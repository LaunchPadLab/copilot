# This migration comes from copilot (originally 20150501215949)
class CreateCopilotUsers < ActiveRecord::Migration
  def change
    create_table :copilot_users do |t|
      t.string :email
      t.string :password
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
