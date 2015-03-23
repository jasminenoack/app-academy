class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  def favorite
    @user = User.find(params[:user_id])
    render json: @user.contacts.where(favorite: true)

  end

  private
  def user_params
    params.require(:user).permit(:user_name)
  end
end
