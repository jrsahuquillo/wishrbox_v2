class Wishlist < ApplicationRecord
  has_many :user_wishlists
  has_many :users, through: :user_wishlists

end
