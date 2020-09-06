class Order < ApplicationRecord

	attachment :image, destroy: false

	has_many :order_products, dependent: :destroy
	belongs_to :member

  enum order_status: {waiting_for_payment: 0, payment_confirmation: 1, making: 2, prepairing_for_shipping: 3, sent: 4}
end
