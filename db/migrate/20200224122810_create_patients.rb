class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :family_name
      t.date :date_of_birth
      t.text :email
      t.text :address
      t.string :phone_number

      t.timestamps
    end
  end
end
