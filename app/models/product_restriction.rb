class ProductRestriction < ApplicationRecord
  belongs_to :product
  belongs_to :diet

  validates :product_id, presence: true
  validates :diet_id, presence: true
end
