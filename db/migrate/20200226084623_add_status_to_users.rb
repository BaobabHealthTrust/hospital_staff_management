class AddStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |u|
      u.string :status
    end
  end
end
