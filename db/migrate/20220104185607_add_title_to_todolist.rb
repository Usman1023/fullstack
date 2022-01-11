class AddTitleToTodolist < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_lists , :title , :string
  end
end
