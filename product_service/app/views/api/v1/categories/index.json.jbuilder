json.categories @categories do |category|
  json.extract! category, :id, :name, :description, :slug, :created_at, :updated_at

  ancestors = category.ancestors.to_a

  mapped_ancestors = ancestors.map do |ancestor|
    {
    id: ancestor.id,
    name: ancestor.name,
    slug: ancestor.slug
    }
  end
  json.parents mapped_ancestors
end