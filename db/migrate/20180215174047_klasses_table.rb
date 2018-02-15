class KlassesTable < ActiveRecord::Migration[5.1]
  def change
      create_table :klasses do |t|
          t.string :name
          t.string :skills
      end
  end
end
