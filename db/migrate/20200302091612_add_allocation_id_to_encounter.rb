class AddAllocationIdToEncounter < ActiveRecord::Migration[6.0]
  def change
    change_table :encounters do |t|
      t.integer :allocation_id
    end
  end
end
