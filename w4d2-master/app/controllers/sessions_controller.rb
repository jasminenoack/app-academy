class SessionsController < ApplicationController
  before_action :require_logged_out, :only => [:new, :create]
  before_action :require_logged_in, :only => [:index, :delete_other]

  def new
  end

  def index
    @sessions = current_user.sessions
  end

  def create
    @env = request.env["HTTP_USER_AGENT"]
    @ip = request.remote_ip
    @user = User.find_by_credentials(
      params[:user_name],
      params[:password]
    )
    if @user
      login!(@user)
      current_session.record_env(@env, @ip)
      redirect_to cats_url

    else
      flash[:notice] = "invalid login credentials"
      render :new
    end
  end

  def destroy
    @session = current_session
    session[:token] = nil
    @session.destroy
    redirect_to new_session_url
  end

  def delete_other
    @session = Session.find(params[:id])
    @session.destroy
    redirect_to :back
  end

end
