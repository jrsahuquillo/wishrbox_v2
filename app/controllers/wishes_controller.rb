class WishesController < ApplicationController
  def index
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    @wish.save
    flash[:success] = "Wish has been created"
    redirect_to wishes_path
  end

  private

  def wish_params
    params.require(:wish).permit(:title, :description)
  end
end
