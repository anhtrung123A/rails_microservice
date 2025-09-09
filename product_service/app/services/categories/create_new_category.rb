class Categories::CreateNewCategory
  include Callable

  def initialize category_params
    @category_params = category_params.to_h
  end

  def call
    result = valid
    if valid.success?
      create_category
    else
      return {
          success: false,
          data: nil,
          errors: result.errors.to_h
      }
    end
  end

  def valid
    return CategoryContract.new.call(@category_params)
  end

  def create_category
    category = Category.new(name: @category_params[:name], description: @category_params[:description])
      begin
        parent = Category.friendly.find(@category_params[:parent_id])
        category.parent = parent
        if category.save
          return {
            success: true,
            data: category,
          }
        else 
          return {
            success: false,
            data: nil,
            errors: ["Cannot create category!"]
          }
        end
      rescue Exception => e
        return {
          success: false,
          data: nil,
          errors: [e]
        }
      end
  end
end