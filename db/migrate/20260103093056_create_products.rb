class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_id, null: false
      t.integer :stock, default: 0
      t.decimal :price, precision: 10, scale: 2
      t.decimal :tax_percentage, precision: 5, scale: 2

      t.timestamps
    end
    add_index :products, :product_id, unique: true
  end
end
