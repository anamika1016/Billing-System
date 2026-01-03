class CreatePurchases < ActiveRecord::Migration[8.0]
  def change
    create_table :purchases do |t|
      t.string :customer_email
      t.decimal :total_without_tax, precision: 10, scale: 2
      t.decimal :total_tax, precision: 10, scale: 2
      t.decimal :net_price, precision: 10, scale: 2
      t.decimal :paid_amount, precision: 10, scale: 2
      t.integer :rounded_net_price
      t.decimal :balance_payable, precision: 10, scale: 2

      t.timestamps
    end
  end
end
