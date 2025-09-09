class Categories::GetAllCategories 
  include Callable
  def call
    return Category.all
  end
end