class CreateEncounters < ActiveRecord::Migration[6.0]
  def change
    create_table :encounters do |t|
      t.string :encounter_type
      t.integer :weight
      t.integer :height
      t.integer :temperature
      t.integer :BP
      t.boolean :voided
      t.string :voided_reason
      t.date :voided_date
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
