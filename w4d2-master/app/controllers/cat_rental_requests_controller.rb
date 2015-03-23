class CatRentalRequestsController < ApplicationController
  before_action :cat_owner, only: [:approve, :deny]

  def new
    @cat_rental_request = CatRentalRequest.new
  end

  def create
    @cat_rental_request = current_user.requests.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      render :new
    end
  end

  def index
    @cat = Cat.find(params[:cat_id])
    @requests = @cat.rental_requests.order(:start_date)
  end

  def approve
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.approve!
    redirect_to cat_url(@cat_rental_request.cat_id)
  end

  def deny
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.deny!
    redirect_to cat_url(@cat_rental_request.cat_id)
  end


  private
  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end

  def cat_owner
    rental = CatRentalRequest.find(params[:id])
    cat = Cat.find_by(id: rental.cat_id)
    redirect_to cats_url unless current_user.id == cat.user_id
  end
end
