class BuildsTable < ActiveRecord::Migration[5.1]
  def change
      create_table :builds do |t|
          t.integer :user_id
          t.string :name
          t.integer :class_id
          t.integer :race_id
      end
  end
end
