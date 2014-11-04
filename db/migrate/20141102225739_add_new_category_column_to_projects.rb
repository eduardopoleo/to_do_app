class AddNewCategoryColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :category, :string
    remove_column :projects, :category_id
  end
end
