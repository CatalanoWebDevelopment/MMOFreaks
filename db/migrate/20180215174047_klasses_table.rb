class KlassesTable < ActiveRecord::Migration
  def change
      create_table :klasses do |t|
          t.string :name
          t.string :skills
      end
  end
end
