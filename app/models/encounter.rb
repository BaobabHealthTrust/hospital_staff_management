class Encounter < ApplicationRecord
  include VoidedBehaviour

  belongs_to :patient
  has_many :allocation
end
