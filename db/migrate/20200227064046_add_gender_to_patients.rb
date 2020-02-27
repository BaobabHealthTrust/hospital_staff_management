class AddGenderToPatients < ActiveRecord::Migration[6.0]
  def change
    change_table :patients do |u|
      u.string :gender
    end
  end
end
