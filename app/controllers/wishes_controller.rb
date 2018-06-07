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

  def show; end

  def edit
    @wish = Wish.find(params[:id])
  end

  def update
    @wish = Wish.find(params[:id])
    if @wish.update(wish_params)
      flash[:success] = "Wish has been updated"
      redirect_to wishes_path
    else
      flash[:danger] = "Wish has not been updated"
      render :edit
    end
  end

  def destroy
    @wish = Wish.find(params[:id])
    if @wish.destroy
      flash[:success] = "Wish has been deleted"
      redirect_to wishes_path
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:title, :description)
  end
end
