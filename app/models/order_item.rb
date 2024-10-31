class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def price
    product.price # Asumiendo que `product` tiene el atributo `price`
  end
end
