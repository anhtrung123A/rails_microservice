extend Rails.application.routes.url_helpers

json.extract! product, :id, :name, :slug, :description, :base_price, :is_active, :created_at, :updated_at, :category

images = product.images.to_a

mapped_images = images.map do |image|
  {
    url: "http://localhost:3000" + rails_blob_url(image, only_path: true),
    filename: image.filename.to_s,
    content_type: image.content_type,
  }
end
json.images mapped_images