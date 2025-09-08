class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.string :ancestry

      t.timestamps
    end
    add_index :categories, :name, unique: true
    add_index :categories, :ancestry
  end
end
