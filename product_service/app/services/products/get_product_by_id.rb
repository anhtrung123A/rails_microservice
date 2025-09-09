class Products::GetProductById
  include Callable

  def initialize id
    @product = Product.friendly.find id
  end

  def call
    return @product
  end
end