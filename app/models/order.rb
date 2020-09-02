class Order < ApplicationRecord

	attachment :image, destroy: false

	has_many :order_products, dependent: :destroy
	belongs_to :member
end
