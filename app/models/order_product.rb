class OrderProduct < ApplicationRecord
	belongs_to :order
	belongs_to :product

  enum order_product_status: {cannot_start: 0, waiting: 1, making: 2, completed: 3}
end
