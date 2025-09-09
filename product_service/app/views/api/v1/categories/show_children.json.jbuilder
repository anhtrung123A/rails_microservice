children = @child_categories.to_a
mapped_children = children.map do |category|
{
  id: category.id,
  name: category.name,
  slug: category.slug
}
end
json.children mapped_children
