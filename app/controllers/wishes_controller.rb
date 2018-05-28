class WishesController < ApplicationController
  def index
    @wishes = Wish.all
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    if @wish.save
      flash[:success] = "Wish has been created"
      redirect_to wishes_path
    else
      flash[:danger] = "Wish has not been created"
      render :new
    end
  end

  def show
    @wish = Wish.find(params[:id])
  end

  private

  def wish_params
    params.require(:wish).permit(:title, :description)
  end
end
