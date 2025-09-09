class Api::V1::InventoriesController < ApplicationController
  def create
    result = Service::InventoryService.create_new_inventory(inventory_params)
    if result[:success]
      @inventory = result[:data]
      render :create, status: :created
    else 
      render json: { errors: result[:errors] }, status: :bad_request
    end
  end

  def show
    @inventory = Service::InventoryService.get_inventory_by_product_slug(params[:id])
    if @inventory
      render :show, status: :ok
    else
      render json: { message: "Inventory not found for product with slug #{params[:id]}" }, status: :not_found
    end
  end

  private

  def inventory_params
    params.permit(:product_name, :product_slug)
  end
  
end