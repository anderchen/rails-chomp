class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user

  has_many :reviews, dependent: :destroy

  has_many :product_restrictions, dependent: :destroy
  has_many :diets, through: :product_restrictions

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :validation, default: false

  accepts_nested_attributes_for :diets, :product_restrictions
end
