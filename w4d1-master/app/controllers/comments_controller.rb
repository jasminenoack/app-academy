class CommentsController < ApplicationController
  def index
    keys = params.keys
    p keys
    if keys.include?("user_id")
      @user = User.find(params[:user_id])
      comments = @user.comments
    elsif keys.include?("contact_id")
      @contact = Contact.find(params[:contact_id])
      comments = @contact.comments
    elsif keys.include?("contact_share_id")
      @contact_share = ContactShare.find(params[:contact_share_id])
      comments = @contact_share.comments
    end

    render json: comments
  end

end
