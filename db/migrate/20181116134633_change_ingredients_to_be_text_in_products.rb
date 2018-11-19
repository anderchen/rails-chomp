class ChangeIngredientsToBeTextInProducts < ActiveRecord::Migration[5.2]
  def change
      change_column :products, :ingredients, :text
  end
end

