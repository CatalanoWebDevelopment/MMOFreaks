class RacesTable < ActiveRecord::Migration[5.1]
  def change
      create_table :races do |t|
          t.string :name
          t.string :attributes
      end
  end
end
