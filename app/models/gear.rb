class Gear < ActiveRecord::Base
    has_many :build_gears
    has_many :builds, through: :build_gears
end