class NotesController < ApplicationController
  before_action :require_logged_in
  before_action :confirm_user, only: :destroy

  def create
    @note = current_user.notes.new(note_params)
    @note.track_id = params[:track_id]
    @note.save
    redirect_to track_url(@note.track)
  end

  def destroy
    @note = Note.find(params[:id])
    @track = @note.track
    @note.destroy
    redirect_to track_url(@track)
  end

  private
  def note_params
    params.require(:note).permit(:body, :track_id)
  end

  def confirm_user
    @note = Note.find(params[:id])
    render text: :forbidden unless current_user == @note.user
  end
end
