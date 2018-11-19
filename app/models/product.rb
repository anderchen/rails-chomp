class Product < ApplicationRecord
  include PgSearch

  pg_search_scope :search_by_name_ingredients_brand_category_traces,
                  against: [
                    [:name, 'A'],
                    [:ingredients, 'C'],
                    [:brand, 'B'],
                    [:category, 'D'],
                    [:traces, 'E']
                  ],
                  using: {
                    tsearch: { prefix: true }
                  }

  mount_uploader :photo, PhotoUploader

  belongs_to :user

  has_many :reviews, dependent: :destroy

  has_many :product_restrictions, dependent: :destroy
  has_many :diets, through: :product_restrictions
  CATEGORIES = ["Vegetable", "Fruit", "Oils", "Meat", "Grains", "Fish", "Milk", "Eggs", "Ice-cream"].sort

  validates :name, presence: true
  validates :ingredients, presence: true
  validates :user_id, presence: true
  validates :validation, default: false
  # validates :category, inclusion: { in: CATEGORIES }

  accepts_nested_attributes_for :diets, :product_restrictions
end
