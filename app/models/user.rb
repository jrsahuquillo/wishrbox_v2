class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wishes
  has_many :user_wishlists
  has_many :wishlists, through: :user_wishlists
  validates_uniqueness_of :username
end
