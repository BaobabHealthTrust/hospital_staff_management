class ChangeRoleName < ActiveRecord::Migration[6.0]
  def change
    change_table :roles do |u|
      u.remove :role
      u.string :role_name
    end
  end
end
