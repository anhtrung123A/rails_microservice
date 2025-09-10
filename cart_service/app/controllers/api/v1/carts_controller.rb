class Api::V1::CartsController < ApplicationController
  include Carts

  def show
    @cart = GetCartByUserId.call params[:id]
    if @cart != []
      render json: { cart: @cart }, status: :ok
    else
      render json: { message: "cart not found" }, status: :not_found
    end
  end

end
