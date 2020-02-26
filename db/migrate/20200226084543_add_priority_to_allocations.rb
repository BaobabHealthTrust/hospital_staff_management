class AddPriorityToAllocations < ActiveRecord::Migration[6.0]
  def change
     change_table :allocations do |u|
      u.integer :priority
    end
  end
end
