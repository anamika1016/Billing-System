class Product < ApplicationRecord
  validates :name, :product_id, :price, presence: true
  validates :product_id, uniqueness: true
end
