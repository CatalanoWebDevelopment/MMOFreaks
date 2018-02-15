class Build < ActiveRecord::Base
    belongs_to :user
    belongs_to :race
    belongs_to :class
    has_many :build_equipments
    has_many :equipment through: :build_equipments
    
    validates :name, presence: true
end