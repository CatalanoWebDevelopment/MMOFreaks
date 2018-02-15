class ClassesTable < ActiveRecord::Migration[5.1]
  def change
      create_table :classes do |t|
          t.string :name
          t.string :skills
      end
  end
end
