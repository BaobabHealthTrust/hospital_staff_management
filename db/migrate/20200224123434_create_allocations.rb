class CreateAllocations < ActiveRecord::Migration[6.0]
  def change
    create_table :allocations do |t|
      t.date :allocation_date
      t.integer :assigned_by
      t.boolean :voided
      t.string :voided_reason
      t.date :voided_date
      t.references :encounter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
