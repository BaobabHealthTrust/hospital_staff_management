class User < ApplicationRecord
    include VoidedBehaviour

    has_one :role
    has_secure_password
    validates :username, presence: true, uniqueness: true

    def self.search(query_params)
        self.where(query_params)
    end

    def self.get_user_by_username(username)
        self.find_by(username: username)
    end


end
