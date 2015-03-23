class GoalsController < ApplicationController

  before_action :require_owner, only: [:edit, :update, :destroy]
  before_action :check_privacy, only: :show

  def show
    @goal = Goal.find(params[:id])
    @comments = @goal.comments
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    @goal.private ||= false

    if @goal.save
      redirect_to goal_url(@goal)
    else
      render :new
    end

  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.private = false unless params[:goal][:private]

    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      render :edit
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    redirect_to users_url
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :private)
  end

  def require_owner
    goal = Goal.find(params[:id])

    unless logged_in? && goal.user_id == current_user.id
      redirect_to users_url
    end
  end

  def check_privacy
    goal = Goal.find(params[:id])

    if goal.private && current_user.id != goal.user_id
      redirect_to user_url(goal.user_id)
    end

  end
end
