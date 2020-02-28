class Patient < ApplicationRecord
    include VoidedBehaviour
    
    has_many :encounter
    def self.search(search_params)
        self.where(search_params)
    end
end
