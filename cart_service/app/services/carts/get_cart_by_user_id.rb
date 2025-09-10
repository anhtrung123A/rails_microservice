class Carts::GetCartByUserId
  include Callable

  def initialize user_id
    @cart = Cart.for_user(user_id)
  end

  def call
    @cart.as_json
  end

end