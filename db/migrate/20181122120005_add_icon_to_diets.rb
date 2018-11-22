class AddIconToDiets < ActiveRecord::Migration[5.2]
  def change
    add_column :diets, :icon, :string
  end
end
