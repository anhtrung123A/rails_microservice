Product.destroy_all

root = Category.create!(name: "Root")
electronics = Category.create!(name: "Electronics", parent: root)
Category.create!(name: "Laptops", parent: electronics)
phones = Category.create!(name: "Phones", parent: electronics)
Category.create!(name: "Smartphones", parent: phones)
Category.create!(name: "Accessories", parent: root)

100.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    base_price: Faker::Number.between(from: 5.0, to: 500.0).round(2),
    category: Category.lowest_categories.sample
  )
end
