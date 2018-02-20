class Karacter < ActiveRecord::Base
    has_many :builds
    
    validates :race, presence: true
end

