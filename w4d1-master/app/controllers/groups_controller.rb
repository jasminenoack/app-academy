class GroupsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    groups = @user.groups

    render json: groups
  end

  def show
    @group = Group.find(params[:id])

    render json: @group.contacts
  end

end
