class WishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wish, only: [:edit, :update, :destroy]

  def index
    @wishes = Wish.all
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    @wish.user = current_user
    if @wish.save
      flash[:notice] = "Wish has been created"
      redirect_to wishes_path
    else
      flash[:danger] = "Wish has not been created"
      render :new
    end
  end

  def show; end

  def edit
  end

  def update
    if @wish.update(wish_params)
      flash[:notice] = "Wish has been updated"
      redirect_to wishes_path
    else
      flash[:danger] = "Wish has not been updated"
      render :edit
    end
  end

  def destroy
    if @wish.destroy
      flash[:notice] = "Wish has been deleted"
      redirect_to wishes_path
    end
  end

  protected

  def resource_not_found
    message = "The wish you are looking for could not be found"
    flash[:danger] = message
    redirect_to root_path
  end

  private

  def set_wish
    @wish = Wish.find(params[:id])
  end

  def wish_params
    params.require(:wish).permit(:title, :description)
  end
end
