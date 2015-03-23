class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_id

  def login!(user)
    user.reset_session_token!
    session[:token] = user.session_token
  end

  def logout!
    current_user.reset_session_token!
    session[:token] = nil
  end

  def current_user
    @cu = User.find_by(session_token: session[:token])
  end

  def current_id
    current_user.id
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    flash[:error] = "You are already logged in"
    redirect_to user_url(current_user) if logged_in?
  end

end
