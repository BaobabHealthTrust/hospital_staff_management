class AddFirstAndLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |e|
      e.string :first_name
      e.string :last_name
    end
  end
end
