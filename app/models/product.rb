class Product < ApplicationRecord
  belongs_to :user

  has_many :product_restrictions, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :validation, default: false
end
