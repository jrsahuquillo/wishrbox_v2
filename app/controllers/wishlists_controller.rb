class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wishlists = current_user.wishlists
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new(wishlists_params)
    @wishlist.users << current_user
    if @wishlist.save
      flash[:notice] = "Wishlist has been created"
      redirect_to wishlists_path
    else
      flash[:danger] = "Wishlist has not been created"
      render :new
    end
  end

  def show; end

  private

  def wishlists_params
    params.require(:wishlist).permit(:title, :description, user_ids: [])
  end
end
