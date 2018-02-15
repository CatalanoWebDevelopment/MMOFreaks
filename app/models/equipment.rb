class Equipment < ActiveRecord::Base
    has_many :buildequipments
    has_many :builds, through: :buildequipments
end