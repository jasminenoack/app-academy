class BandsController < ApplicationController
  before_action :require_logged_in
  before_action :require_band_owner, only: [:edit, :update, :destroy]

  def index
    @bands = Band.all.order(:name)
  end

  def show
    @band = Band.find(params[:id])
    @user = @band.user
  end

  def new
    @band = Band.new
  end

  def create
    @band = current_user.favorite_bands.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

  def require_band_owner
    band = Band.find(params[:id])
    unless band.owner_id == current_id
      flash[:error] = "That is not your copy of the band, please create or edit your copy"
      redirect_to band_url(band)
    end
  end
end
