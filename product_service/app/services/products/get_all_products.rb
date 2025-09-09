class Products::GetAllProducts
  include Callable

  def initialize page, per_page
    @products = Product.page(page).per(per_page)
  end

  def call
    return @products
  end
end