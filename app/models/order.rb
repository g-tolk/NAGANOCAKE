class Order < ApplicationRecord

	attachment :image, destroy: false

	has_many :order_products, dependent: :destroy
	belongs_to :member

  enum pay_status: {bank_transfer: 0, card_payment: 1}
  if enum order_product_status == 2

    enum order_status == 2

  end

  enum order_status: {waiting_for_payment: 0, payment_confirmation: 1, making: 2, prepairing_for_shipping: 3, sent: 4}
end
