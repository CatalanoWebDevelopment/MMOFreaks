class GearsTable < ActiveRecord::Migration
  def change
      create_table :gears do |t|
          t.string :stats
          t.string :name
          t.string :head
          t.string :chest
          t.string :arms
          t.string :feet
      end
  end
end
