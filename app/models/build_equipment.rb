class BuildEquipment < ActiveRecord::Base
    belongs_to :build
    belongs_to :equipment
end