class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  has_many :shipping_addresses, dependent: :destroy
end
