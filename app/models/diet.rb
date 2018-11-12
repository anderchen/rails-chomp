class Diet < ApplicationRecord
  has_many :user_restrictions
  has_many :product_restrictions
end
