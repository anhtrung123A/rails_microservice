class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :slug, :description, :base_price, :is_active, :created_at, :updated_at
  attribute :image_urls do |product|
    if product.images.attached?
      product.images.map do |image|
        Rails.application.routes.url_helpers.rails_blob_url(image, only_path: false)
      end
    else
      []
    end
  end
  attribute :category do |product|
    category = product.category
    if category != nil
      mapped_parent_categories = category.ancestors.map do |parent_category|
        {
          id: parent_category.id,
          name: parent_category.name,
          slug: parent_category.slug
        }
      end
      {
        id: category.id,
        name: category.name,
        slug: category.slug,
        parent: mapped_parent_categories
      }
    else
      nil
    end
  end
end
