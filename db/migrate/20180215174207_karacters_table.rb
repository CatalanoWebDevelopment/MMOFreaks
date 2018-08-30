class KaractersTable < ActiveRecord::Migration
  def change
      create_table :karacters do |t|
         t.string :race
      end
  end
end
