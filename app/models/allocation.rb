class Allocation < ApplicationRecord
  require 'date'
  belongs_to :encounter
  before_create do
    self.allocation_date = Date.today unless self.allocation_date
  end
end
