class Wishlist < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :title
  validates_length_of :title, minimum: 3, maximum: 30, allow_blank: false

  default_scope { order(created_at: :desc) }

  has_many :user_wishlists
  has_many :users, through: :user_wishlists

end
