class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :kana_family_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :kana_first_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :telephone_number, presence: true, numericality: true
  validates :postal_code, presence: true, numericality: true
  validates :address, presence: true

  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy


    def active_for_authentication?
        super && self.is_withdeawal_status
    end

    def full_name
      self.family_name + self.first_name
    end
end
