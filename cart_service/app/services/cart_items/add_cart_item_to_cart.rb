class CartItems::AddCartItemToCart
  include Callable

  def initialize user_id, cart_item_params
    @cart = Cart.for_user(user_id)
    @cart_item_params = cart_item_params.to_h
  end

  def call
    cart_item = CartItem.new(@cart_item_params)
    if cart_item.valid?
      existed_cart_item = @cart.cart_items.where(product_id: cart_item[:product_id]).first
      if existed_cart_item && existed_cart_item.final_price == cart_item.final_price
        existed_cart_item.quantity += cart_item.quantity
      elsif (existed_cart_item && existed_cart_item.final_price != cart_item.final_price) || !existed_cart_item
        @cart.cart_items << cart_item
      end
      @cart.save!
    end
  end

end