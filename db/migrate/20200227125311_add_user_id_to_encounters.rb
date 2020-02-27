class AddUserIdToEncounters < ActiveRecord::Migration[6.0]
  def change
    change_table :encounters do |u|
      u.integer :user_id
    end
  end
end
