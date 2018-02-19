class Equipment < ActiveRecord::Base
    has_many :build_equipments
    has_many :builds, through: :build_equipments
end