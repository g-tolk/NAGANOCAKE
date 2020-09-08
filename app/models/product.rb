class Product < ApplicationRecord
  attachment :image
	has_many :cart_products, dependent: :destroy
	has_many :order_products, dependent: :destroy
	belongs_to :genre

	validates :name, presence: true, uniqueness: true
  	validates :genre_id, presence: true
end
