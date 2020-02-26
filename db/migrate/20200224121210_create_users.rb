class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.date :date_of_birth, null: false
      t.text :email, null: false
      t.boolean :voided
      t.string :voided_reason
      t.date :voided_date

      t.timestamps
    end
  end
end
