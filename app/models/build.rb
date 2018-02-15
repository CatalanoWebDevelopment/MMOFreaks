class Build < ActiveRecord::Base
    belongs_to :user
    belongs_to :race
    belongs_to :klass
    has_many :buildequipments
    has_many :equipments, through: :buildequipments
    
    validates :name, presence: true
end