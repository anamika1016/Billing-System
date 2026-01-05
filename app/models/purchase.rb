class Purchase < ApplicationRecord
  has_many :purchase_items, dependent: :destroy
  accepts_nested_attributes_for :purchase_items

  def balance_denominations
    bal = [ balance_payable.to_i, 0 ].max
    denoms = [ 500, 50, 20, 10, 5, 2, 1 ]
    result = {}

    denoms.each do |d|
      count = bal / d
      result[d] = count
      bal %= d
    end
    result
  end
end
