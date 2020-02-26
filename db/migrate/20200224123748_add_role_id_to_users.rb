class AddRoleIdToUsers < ActiveRecord::Migration[6.0]
  def change 
    change_table :users do |u|
      u.remove :role_id
      add_reference :users, :role, foreign_key: true
    end
  end
end
