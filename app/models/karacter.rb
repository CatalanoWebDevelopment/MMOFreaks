class Character < ActiveRecord::Base
    has_many :builds
    
    validates :name, presence: true
    validates :attributes, presence: true
end

