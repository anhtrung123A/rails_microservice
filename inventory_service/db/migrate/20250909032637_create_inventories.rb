class CreateInventories < ActiveRecord::Migration[8.0]
  def change
    create_table :inventories do |t|
      t.string :product_name
      t.string :product_slug
      t.string :image_url
      t.integer :reserved_quantity, default: 0
      t.integer :actual_quantity, default: 0
      t.integer :expected_quantity, default: 0
      t.integer :threshold, default: 0

      t.timestamps
    end
    add_index :inventories, :product_slug, unique: true
  end
end
