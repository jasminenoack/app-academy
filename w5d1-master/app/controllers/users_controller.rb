class UsersController < ApplicationController
  before_action :require_login, only: :show

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to users_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @goals = @user.goals
    @comments = @user.comments
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

end
