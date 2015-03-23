class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(params[:username], params[:password])

    if @user && login!(@user)
      redirect_to users_url
    else
      flash[:error] = "invalid login"
      render :new
    end
  end

  def destroy
    logout!
    redirect_to users_url
  end
end
