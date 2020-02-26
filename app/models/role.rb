class Role < ApplicationRecord
    has_many :user
    validates :role_name, presence: true
    validates :description, presence: true
end
