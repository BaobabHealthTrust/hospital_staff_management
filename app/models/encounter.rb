class Encounter < ApplicationRecord
  belongs_to :patient
  has_many :allocation
end
