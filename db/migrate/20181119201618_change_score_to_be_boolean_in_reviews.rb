class ChangeScoreToBeBooleanInReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :score
    add_column :reviews, :approved, :boolean
  end
end
