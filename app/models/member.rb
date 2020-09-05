class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :kana_family_name, presence: true
  validates :kana_first_name, presence: true
  validates :telephone_number, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

enum is_withdeawal_status: {Available: true, Invalid: false}
    #有効会員はtrue、退会済み会員はfalse

    def active_for_authentication?
        super && (self.is_withdeawal_status === "Available")
    end
end
