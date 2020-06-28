class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      
      t.references :category
      t.references :product
      t.integer :count, precision: 10, scale: 2
      t.timestamps
    end
  end
end
