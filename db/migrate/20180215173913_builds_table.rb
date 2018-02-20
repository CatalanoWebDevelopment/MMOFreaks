class BuildsTable < ActiveRecord::Migration[5.1]
  def change
      create_table :builds do |t|
          t.integer :user_id
          t.string :name
          t.integer :klass_id
          t.integer :race_id
          t.string :description
          t.integer :karacter_id
      end
  end
end
