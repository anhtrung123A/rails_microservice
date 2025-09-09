module Service
  class InventoryService
    def self.create_new_inventory inventory_params
      contract = InventoryContract.new
      result = contract.call(inventory_params.to_h)
      if result.success?
        inventory = Inventory.new(inventory_params.to_h)
        begin
          if inventory.save
          return {
            success: true,
            data: inventory,
          }
        else 
          return {
            success: false,
            data: nil,
            errors: ["Cannot create inventory!"]
          }
        end
        rescue Exception => e
          return {
            success: false,
            data: nil,
            errors: [e]
          }
        end
        
      else 
        return {
          success: false,
          data: nil,
          errors: result.errors.to_h
        }
      end
    end

    def self.get_inventory_by_product_slug product_slug
      with_inventory(product_slug) do |inventory|
        inventory
      end
    end

    def self.reserve_inventory order_params
      with_inventory(order_params[:product_slug]) do |inventory|
        inventory.reserve_inventory(order_params[:quantity])
      end
    end

    def self.confirm_reservation order_params
      with_inventory(order_params[:product_slug]) do |inventory|
        inventory.confirm_reservation(order_params[:quantity])
      end
    end

    def self.deliver order_params
      with_inventory(order_params[:product_slug]) do |inventory|
        inventory.deliver(order_params[:quantity])
      end
    end

    private_class_method def self.with_inventory product_slug
      inventory = Inventory.find_by(product_slug: product_slug)
      yield(inventory) if inventory
    end

  end
end
