class Genre < ApplicationRecord
	# has_many :products, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  enum valid_status: { good: true , bad: false}
end
