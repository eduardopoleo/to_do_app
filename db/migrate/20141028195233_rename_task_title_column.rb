class RenameTaskTitleColumn < ActiveRecord::Migration
  def change
    rename_column :tasks, :title, :task_name
  end
end
