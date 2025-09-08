module Service

  class ProductService

    def self.get_all_products(page, per_page)
      Product.page(page).per(per_page)
    end

    def self.get_product_by_id id
      begin
        product = Product.find(id)
        if product
          return product
        end
      rescue
        return nil 
      end
    end

    def self.create_new_product product_params
      contract = ProductContract.new
      result = contract.call(product_params.to_h)
      if result.success?
        product = Product.new(product_params)
        if product.save
          return {
            success: true,
            data: product,
          }
        else 
          return {
            success: false,
            data: nil,
            errors: ["Cannot create product!"]
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

  end

end
