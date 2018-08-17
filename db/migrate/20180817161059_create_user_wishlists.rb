class CreateUserWishlists < ActiveRecord::Migration[5.1]
  def change
    create_table :user_wishlists do |t|
      t.integer :user_id
      t.integer :wishlist_id
    end
  end
end
