class Wish < ApplicationRecord
  validates :title, presence: true

  default_scope { order(created_at: :desc) }
end
