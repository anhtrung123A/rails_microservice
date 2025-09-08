class AddChildrenCountToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :children_count, :integer
  end
end
