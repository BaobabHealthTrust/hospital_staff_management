class AddUserIdToEncounter < ActiveRecord::Migration[6.0]
  def change
    change_table :encounters do |t|
      t.integer :user_id
    end
  end
end
