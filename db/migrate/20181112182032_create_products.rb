class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :ingredients
      t.string :photo
      t.boolean :validation
      t.string :brand
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
