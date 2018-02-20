class Build < ActiveRecord::Base
    belongs_to :user
    belongs_to :karacter
    belongs_to :klass
    has_many :comments
    has_many :build_gears
    has_many :gears, through: :build_gears
    
    validates :name, presence: true
end