class Product < ApplicationRecord

  belongs_to :category
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many_attached :images

end
