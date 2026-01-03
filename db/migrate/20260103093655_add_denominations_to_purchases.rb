class AddDenominationsToPurchases < ActiveRecord::Migration[8.0]
  def change
    add_column :purchases, :denominations_collected, :json
  end
end
