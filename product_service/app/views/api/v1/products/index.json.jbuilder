# json.array! @products, partial: 'product', as: :product
json.products @products do |product|
  json.partial! 'product', product: product
end
json.pagination do
  json.current_page @products.current_page
  json.per_page @products.limit_value
  json.total_pages @products.total_pages
  json.total_count @products.total_count
  json.next_page @products.next_page if @products.next_page
  json.prev_page @products.prev_page if @products.prev_page
end
