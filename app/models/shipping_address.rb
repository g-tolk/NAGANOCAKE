class ShippingAddress < ApplicationRecord
	belongs_to :member

	def together
    self.postal_code + self.address + self.name
  end
end
