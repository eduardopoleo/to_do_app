class AddStatusEraseColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :checked, :boolean
    add_column :tasks, :erased, :boolean
  end
end
