class ShippingAddress < ApplicationRecord
	belongs_to :member

  validates :name, presence: true
  validates :postal_code, presence: true, numericality: true

	def together
    self.postal_code + self.address + self.name
  end
end
