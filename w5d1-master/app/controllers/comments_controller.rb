class CommentsController < ApplicationController

  def create
    if params[:user_id]
      @user = User.find(params[:user_id])
      @comment = @user.comments.new(comment_params)
    elsif params[:goal_id]
      @goal = Goal.find(params[:goal_id])
      @comment = @goal.comments.new(comment_params)
    end
    @comment.author_id = current_user.id

    unless @comment.save
      flash[:error] = "Comment cannot be blank"
    end

    if @user
      redirect_to user_url(@user)
    else
      redirect_to goal_url(@goal)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end


end
