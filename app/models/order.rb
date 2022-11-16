class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  def postal_code
    1234567.to_s.insert(3, "-")
  end
end
