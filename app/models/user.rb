class User < ApplicationRecord
    has_one :role
    has_secure_password
    validates :username, presence: true, uniqueness: true
end
