class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.decimal :base_price
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
