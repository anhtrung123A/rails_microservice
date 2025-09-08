class Api::V1::ProductsController < ApplicationController

  def index
    @products = Service::ProductService.get_all_products(params[:page] || 1, params[:per_page] || 20)
    if @products.length > 0
      render :index, status: :ok
    else
      render json: { message: "Products list is currently empty!"}, status: :not_found
    end
  end

  def show
    @product = Service::ProductService.get_product_by_id(params[:id])
    if @product != nil
      render :show, status: :ok
    else
      render json: { message: "Product with id: #{params[:id]} not found!"}, status: :not_found
    end
  end

  def create
    result = Service::ProductService.create_new_product(product_params)
    if result[:success]
      @product = result[:data]
      render :create, status: :created
    else 
      render json: { errors: result[:errors] }, status: :bad_request
    end
  end

  private

  def product_params
    params.permit(:name, :base_price, :description, images: [])
  end

end