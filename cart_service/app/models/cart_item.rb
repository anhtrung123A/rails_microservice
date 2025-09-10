class CartItem
  include Mongoid::Document

  embedded_in :cart

  field :product_id, type: Integer
  field :product_name, type: String
  field :product_slug, type: String
  field :image_url, type: String
  field :quantity, type: Integer, default: 1
  field :final_price, type: Float

  validates :product_id, presence: true
  validates :product_name, presence: true
  validates :product_slug, presence: true
  validates :image_url, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :final_price, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

  def total_price
    quantity * final_price
  end

end
