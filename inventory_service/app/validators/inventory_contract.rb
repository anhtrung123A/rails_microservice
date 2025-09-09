class InventoryContract < Dry::Validation::Contract
  params do
    required(:product_name).filled(:string)
    required(:product_slug).filled(:string)
  end
end