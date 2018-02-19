class EquipmentsTable < ActiveRecord::Migration[5.1]
  def change
      create_table :equipments do |t|
          t.string :stats
          t.string :name
          t.string :head
          t.string :chest
          t.string :arms
          t.string :feet
      end
  end
end
