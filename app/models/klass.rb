class Klass < ActiveRecord::Base
    has_many :builds
    has_many :races, through: :builds
    
    validates :name, presence: true
end