class Diet < ApplicationRecord
  has_many :user_restrictions, dependent: :destroy
  has_many :product_restrictions, dependent: :destroy

  validates :name
end
