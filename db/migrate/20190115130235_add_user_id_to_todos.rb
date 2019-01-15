class AddUserIdToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :user_id, :integer
    # => read as : "add column to the todos table, the column should be user_id as an integer value"
  end
end
