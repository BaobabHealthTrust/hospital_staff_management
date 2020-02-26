class User < ApplicationRecord
    has_one :role
    has_secure_password
    validates :username, presence: true, uniqueness: true

    def self.search(query_params)
        self.where(query_params)
    end
end
