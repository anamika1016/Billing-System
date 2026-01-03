class Product < ApplicationRecord
  validates :name, :product_id, :price, presence: true
  validates :product_id, uniqueness: true
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
