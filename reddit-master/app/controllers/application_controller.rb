class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :current_user_id

  def require_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to do that"
      redirect_to new_session_url
    end
  end

  def require_logged_out
    if logged_in?
      flash[:error] = "You're already logged in, silly!"
      redirect_to subs_url
    end
  end

  def login!(user)
    session[:token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:token] = nil
  end

  def logged_in?
    !!current_user
  end

  def current_user
    return if session[:token].nil?
    @cu ||= User.find_by(session_token: session[:token])
  end

  def current_user_id
    @id ||= current_user.id
  end
end
