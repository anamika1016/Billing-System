# Seed products
Product.create!([
  { name: "Bread", product_id: "P001", stock: 100, price: 40.00, tax_percentage: 5.0 },
  { name: "Milk", product_id: "P002", stock: 50, price: 25.00, tax_percentage: 0.0 },
  { name: "Butter", product_id: "P003", stock: 30, price: 250.00, tax_percentage: 12.0 },
  { name: "Cheese", product_id: "P004", stock: 20, price: 350.00, tax_percentage: 12.0 },
  { name: "Chips", product_id: "P005", stock: 200, price: 20.00, tax_percentage: 18.0 }
])
puts "Seeded #{Product.count} products."
