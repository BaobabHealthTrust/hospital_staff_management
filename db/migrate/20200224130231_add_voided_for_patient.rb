class AddVoidedForPatient < ActiveRecord::Migration[6.0]
  def change
    change_table :patients do |t|
      t.boolean :voided
      t.string :voided_reason
      t.date :voided_date
    end
  end
end
