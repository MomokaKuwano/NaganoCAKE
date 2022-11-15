class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def sum
  item.add_tax_price*amount
  end

end
