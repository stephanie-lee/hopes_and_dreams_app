class AddUserIdToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :user_id, :integer, null: false, default: 1
    change_column_default(:goals, :user_id, nil)
  end
end
