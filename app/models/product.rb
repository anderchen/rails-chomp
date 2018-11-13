class Product < ApplicationRecord
  belongs_to :user

  has_many :product_restrictions, dependent: :destrouy
  has_many :reviews, dependent: :destroy
end
