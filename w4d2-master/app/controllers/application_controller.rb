class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_session

  def login!(user)
    current_session = user.sessions.new
    current_session.save
    session[:token] = current_session.session_token
  end

  def current_user
    return nil unless current_session
    @cu ||= User.find_by(id: current_session.user_id)
  end

  def current_session
    return nil unless session[:token]
    @session ||= Session.find_by(session_token: session[:token])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_out
    redirect_to cats_url if logged_in?
  end

  def require_logged_in
    redirect_to cats_url unless logged_in?
  end

end
