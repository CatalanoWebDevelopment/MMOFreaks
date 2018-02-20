class KaractersTable < ActiveRecord::Migration[5.1]
  def change
      create_table :karacters do |t|
         t.string :race
      end
  end
end
