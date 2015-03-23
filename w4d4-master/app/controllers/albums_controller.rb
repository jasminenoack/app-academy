class AlbumsController < ApplicationController
  before_action :require_logged_in
  
  def show
    @album = Album.find(params[:id])
    @tracks = @album.tracks
    @band = @album.band
  end

  def new
    @band = Band.find(params[:band_id])
    @album = @band.albums.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      @band = @album.band
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    @band = @album.band
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      @band = @album.band
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @band = @album.band

    @album.destroy
    redirect_to band_url(@band)
  end

  private
  def album_params
    params.require(:album).permit(:kind, :name, :year, :band_id)
  end
end
