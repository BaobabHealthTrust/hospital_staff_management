class AddStatusToAllocations < ActiveRecord::Migration[6.0]
  def change
    change_table :allocations do |t|
      t.integer :status, :default => 0
      #Ex:- :default =>''
    end
  end
end
