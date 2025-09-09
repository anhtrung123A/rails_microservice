class Api::V1::ProductsController < ApplicationController

  def index
    @products = Products::GetAllProducts.call params[:page] || 1, params[:per_page] || 20
    if @products.length > 0
      render :index, status: :ok
    else
      render json: { products: [] }, status: :ok
    end
  end

  def show
    @product = Products::GetProductById.call params[:id]
    if @product != nil
      render :show, status: :ok
    else
      render json: { message: "Product not found!"}, status: :not_found
    end
  end

  def create
    result = Products::CreateNewProduct.call product_params
    if result[:success]
      @product = result[:data]
      render :create, status: :created
    else 
      render json: { errors: result[:errors] }, status: :bad_request
    end
  end

  private

  def product_params
    params.permit(:name, :base_price, :description, :category_id, images: [])
  end

end