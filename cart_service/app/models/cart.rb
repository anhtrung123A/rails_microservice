class Cart
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer

  embeds_many :cart_items

  index({ user_id: 1 })

  def total_price
    cart_items.sum(&:total_price) 
  end

  def self.for_user(user_id)
    where(user_id: user_id).first || create!(user_id: user_id)
  end

end
