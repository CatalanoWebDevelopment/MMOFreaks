class EquipmentTable < ActiveRecord::Migration[5.1]
  def change
      create_table :equipment do |t|
          t.string :stats
          t.string :name
      end
  end
end
