class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Categories::GetAllCategories.call
    if @categories.length > 0
      render :index, status: :ok
    else
      render json: { message: "Categories list empty!"}, status: :not_found
    end
  end

  def show
    @category = Categories::GetCategoryById.call params[:id]
    if @category != nil
      render :show, status: :ok
    else
      render json: { message: "Category not found!"}, status: :not_found
    end
  end

  def create
    result = Categories::CreateNewCategory.call category_params
    if result[:success]
      @category = result[:data]
      render :create, status: :created
    else 
      render json: { errors: result[:errors] }, status: :bad_request
    end
  end

  def show_children
    @child_categories = Categories::GetChildCategoriesById.call params[:id]
    if @child_categories.length > 0
      render :show_children, status: :ok
    else
      render json: { message: "Child categories list empty!"}, status: :not_found
    end
  end 

  private

  def category_params
    params.permit(:name, :description, :parent_id)
  end

end