class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :score, presence: true
  validates :content, length: { minimum: 20 }
end
