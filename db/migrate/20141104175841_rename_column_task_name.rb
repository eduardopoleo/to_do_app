class RenameColumnTaskName < ActiveRecord::Migration
  def change
    rename_column :tasks, :task_name, :description
  end
end
