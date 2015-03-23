class TracksController < ApplicationController
  before_action :require_logged_in

  def show
    @track = Track.find(params[:id])
    @notes = @track.notes
    @note = current_user.notes.new
  end

  def new
    @album = Album.find(params[:album_id])
    @track = @album.tracks.new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      @album = @track.album
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      @album = @track.album
      render :edit
    end
  end


  def destroy
    @track = Track.find(params[:id])
    @album = @track.album

    @track.destroy
    redirect_to album_url(@album)
  end

  private
  def track_params
    params.require(:track).permit(:name, :lyrics, :album_id, :bonus)
  end
end
