class Category < ApplicationRecord
  has_ancestry
  has_many :products, dependent: :destroy
  extend FriendlyId
  friendly_id :name, use: :slugged
  after_save :update_ancestry_children_counts
  after_destroy :update_ancestry_children_counts

  scope :lowest_categories, -> { where(children_count: 0) }
  def update_ancestry_children_counts
    # Update children_count for self and all ancestors
    [self, *ancestors].each do |node|
      node.update_column(:children_count, node.children.count)
    end
  end
  
end
