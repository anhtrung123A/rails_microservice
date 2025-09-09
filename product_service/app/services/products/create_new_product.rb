class Products::CreateNewProduct
  include Callable

  def initialize product_params
    @product_params = product_params.to_h
  end
  
  def call
    result = valid
    if valid.success?
      create_product
    else
      return {
          success: false,
          data: nil,
          errors: result.errors.to_h
      }
    end
  end

  def valid
    return ProductContract.new.call @product_params
  end

  def create_product
    product = Product.new @product_params
    begin
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
    rescue Exception => e
      return {
        success: false,
        data: nil,
        errors: [e]
      }
    end
  end
end