class Api::V1::CartItemsController < ApplicationController
  include CartItems

  def create
    AddCartItemToCart.call(params[:cart_id], cart_item_params)
    render json: {data: 1}, status: :created
  end

  def destroy
    
  end

  private

  def cart_item_params
    params.permit(:product_id, :product_name, :product_slug, :image_url, :quantity, :final_price)
  end

end
