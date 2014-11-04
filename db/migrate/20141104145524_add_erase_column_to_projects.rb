class AddEraseColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :erased, :boolean
  end
end
