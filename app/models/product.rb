class Product < ApplicationRecord
  belongs_to :user

  has_many :product_restrictions
  has_many :reviews
end
