class CatsController < ApplicationController
  before_action :cat_owner, only: [:edit, :update, :destroy]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    @requests = @cat.rental_requests.order(:start_date)
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = current_user.cats.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to cats_url
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :name, :description, :sex, :color)
  end

  def cat_owner
    redirect_to cats_url unless current_user.id == Cat.find(params[:id]).user_id
  end

end
