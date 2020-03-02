class Allocation < ApplicationRecord
  include VoidedBehaviour

  require 'date'
  before_create do
    self.allocation_date = Date.today unless self.allocation_date
  end


  def self.get_allocations(params)
    utils = UtilsController.new
    query =  "SELECT patients.*, allocations.*, roles.*,
              concat(users.first_name, ' ', users.last_name) as user_assigned_to
              FROM allocations
              INNER JOIN patients on patients.id = allocations.patient_id 
              INNER JOIN users ON allocations.assigned_to = users.id
              INNER JOIN roles ON roles.id = users.role_id"
    if params[:user_id]
      query = query + " WHERE allocations.assigned_to = #{params[:user_id]}"
    end
    if params[:status]
      condition = utils.get_condition(query)
      query = query + " #{condition} allocations.status = #{params[:status]}"
    end
    query = utils.construct_date_query(query, 'allocations', params)
    return self.find_by_sql(query)
  end

  def self.update_allocation(id)
    allocation = self.find_by(id: id)
    allocation.update(status: 1)
  end
end
