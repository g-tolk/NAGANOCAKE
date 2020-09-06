class CartProduct < ApplicationRecord
	belongs_to :member
	belongs_to :product, optional: true
end
