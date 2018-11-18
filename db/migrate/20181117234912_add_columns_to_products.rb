class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_number, :string
    add_column :products, :upc, :string
    add_column :products, :traces, :text
  end
end
