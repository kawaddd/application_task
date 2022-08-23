class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum crafting_status: { waiting_for_payment: 0, payment_confirmation: 1, producing: 2, shipping_preparation: 3 }
  
  def subtotal
    item.price * amount
  end
  
  def add_tax_price
    (unit_price * 1.1).floor
  end
end
