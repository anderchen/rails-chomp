class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :approved, inclusion:{ in: [true, false]}
  validates :content, length: { minimum: 5 }
end
