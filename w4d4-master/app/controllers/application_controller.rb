class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def login!(user)
    user.reset_session_token!
    session[:token] = user.session_token
  end

  def logout!(user)
    user.reset_session_token!
    session[:token] = nil
  end

  def logged_in?
    !!current_user
  end

  def current_user
    return nil unless session[:token]
    @cu = User.find_by(session_token: session[:token])
  end
end
