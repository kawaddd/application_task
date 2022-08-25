class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum crafting_status: { waiting_for_payment: 0, payment_confirmation: 1, producing: 2, shipping_preparation: 3 }
  
  def subtotal
    #item.price * amount
    item.add_tax_price * amount
  end
end
