class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null:false
      t.text :body, null:false
      t.boolean :private_goal, :default => false, null:false
      t.boolean :completed, :default => false, null:false

      t.timestamps null: false
    end
  end
end
