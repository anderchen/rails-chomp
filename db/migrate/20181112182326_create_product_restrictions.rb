class CreateProductRestrictions < ActiveRecord::Migration[5.2]
  def change
    create_table :product_restrictions do |t|
      t.references :product, foreign_key: true
      t.references :diet, foreign_key: true

      t.timestamps
    end
  end
end
