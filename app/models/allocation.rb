class Allocation < ApplicationRecord
  include VoidedBehaviour

  require 'date'
  before_create do
    self.allocation_date = Date.today unless self.allocation_date
  end


  def self.get_allocations
    self.joins("INNER JOIN patients on patients.id = allocations.patient_id 
                INNER JOIN users ON allocations.assigned_to = users.id
                INNER JOIN roles ON roles.id = users.role_id")
        .select("patients.*, allocations.*, roles.*,
                concat(users.first_name, ' ', users.last_name) as user_assigned_to")
  end

  def self.update_allocation(id)
    allocation = self.find_by(id: id)
    allocation.update(status: 1)
  end
end
