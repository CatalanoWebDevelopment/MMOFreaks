class BuildGearsTable < ActiveRecord::Migration
  def change
      create_table :build_gears do |t|
          t.integer :build_id
          t.integer :gear_id
      end
  end
end
