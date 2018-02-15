class BuildEquipmentsTable < ActiveRecord::Migration[5.1]
  def change
      create_table :build_equipments do |t|
          t.integer :build_id
          t.integer :equipment_id
      end
  end
end
