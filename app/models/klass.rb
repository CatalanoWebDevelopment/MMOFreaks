class Klass < ActiveRecord::Base
    has_many :builds
    has_many :karacters, through: :builds
    
    validates :name, presence: true
end