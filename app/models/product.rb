class Product < ApplicationRecord
  attachment :image
	has_many :cart_products, dependent: :destroy
	has_many :order_products, dependent: :destroy

  validates :genre_id, presence: true

  belongs_to :genre
end
