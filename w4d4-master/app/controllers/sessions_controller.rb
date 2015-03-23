class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(params[:email], params[:password])
    if @user
      login!(@user)
      redirect_to bands_url
    else
      flash.now[:error] = "Invalid login"
      render :new
    end
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_url
  end

end
