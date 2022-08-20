class OrderDetail < ApplicationRecord
  belongs_to :order
  enum crafting_status: { waiting_for_payment: 0, payment_confirmation: 1, producing: 2, shipping_preparation: 3 }
  
  def subtotal
    item.price * amount
  end
end
