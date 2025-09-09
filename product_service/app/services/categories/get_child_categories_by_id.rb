class Categories::GetChildCategoriesById
  include Callable

  def initialize id
    @category = Categories::GetCategoryById.call id
  end

  def call
    begin
      return @category.children
    rescue
      return [] 
    end
  end

end