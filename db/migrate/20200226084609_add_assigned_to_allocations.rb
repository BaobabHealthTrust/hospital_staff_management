class AddAssignedToAllocations < ActiveRecord::Migration[6.0]
  def change
    change_table :allocations do |u|
      u.integer :assigned_to
      add_reference :allocations, :users, foreign_key: :assigned_to
    end
  end
end
