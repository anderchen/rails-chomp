class ProductRestriction < ApplicationRecord
  belongs_to :product
  belongs_to :diet

  validates :product, presence: true
  validates :diet, presence: true

  mount_uploader :photo, PhotoUploader
end
