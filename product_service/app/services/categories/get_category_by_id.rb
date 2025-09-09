class Categories::GetCategoryById
  include Callable
  def initialize id
      @category = Category.friendly.find id
  end
  def call
    return @category
  end
end