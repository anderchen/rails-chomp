class UserRestriction < ApplicationRecord
  belongs_to :user
  belongs_to :diet

  validates :user_id, presence: true
  validates :diet_id, presence: true
end
