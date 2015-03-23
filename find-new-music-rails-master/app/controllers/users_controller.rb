class UsersController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @bands = @user.favorite_bands
  end

  private
  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :confirm_password
    )
  end
end
