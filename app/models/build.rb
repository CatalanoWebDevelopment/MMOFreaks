class Build < ActiveRecord::Base
    belongs_to :user
    belongs_to :karacter
    belongs_to :klass
    has_many :comments
    has_many :build_equipments
    has_many :equipments, through: :build_equipments
    
    validates :name, presence: true
end