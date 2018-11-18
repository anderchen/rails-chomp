class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user

  has_many :reviews, dependent: :destroy

  has_many :product_restrictions, dependent: :destroy
  has_many :diets, through: :product_restrictions
  CATEGORIES = ["Vegetable", "Fruit", "Oils", "Meat", "Grains", "Fish", "Milk", "Eggs"].sort

  validates :name, presence: true
  validates :ingredients, presence: true
  validates :user_id, presence: true
  validates :validation, default: false
  validates :category, inclusion: { in: CATEGORIES }

  accepts_nested_attributes_for :diets, :product_restrictions
end
