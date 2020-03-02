class ChangeUserIdToPatientId < ActiveRecord::Migration[6.0]
  def change
    change_table :allocations do |t|
      t.remove :user_id
      t.integer :patient_id
    end
  end
end
