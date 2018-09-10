class BuildGear < ActiveRecord::Base
    belongs_to :build
    belongs_to :gear
end