json.inventory do
  json.id @inventory.id
  json.product_name @inventory.product_name
  json.product_slug @inventory.product_slug
  json.reserved_quantity @inventory.reserved_quantity
  json.actual_quantity @inventory.actual_quantity
  json.expected_quantity @inventory.expected_quantity
  json.created_at @inventory.created_at
  json.updated_at @inventory.updated_at
end
