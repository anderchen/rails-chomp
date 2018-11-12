class ProductRestriction < ApplicationRecord
  belongs_to :product
  belongs_to :diet
end
