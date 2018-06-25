module WishesHelper

  def wish_user_signed_in?(wish_user)
    wish_user == current_user
  end
end
