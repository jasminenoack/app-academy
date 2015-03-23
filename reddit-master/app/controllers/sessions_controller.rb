class SessionsController < ApplicationController
  before_action :require_logged_out, except: :destroy
  before_action :require_logged_in, only: :destroy

  def create
    @user = User.find_by_credentials(params[:username], params[:password])

    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash.now[:error] = "Invalid login"
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def new
  end

end
