class CartItems::DeleteCartItemFromCart
  include Callable

  def initialize id
    @cart_item = Cart.cart_items.
  end

  def call
  end
end