class CommentsController < ApplicationController
  before_action :require_logged_in, except: :show

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to comment_url(@comment.parent)
    else
      @post = Post.find(@comment.post_id)
      @parent = Comment.find(@comment.parent_id) if @comment.parent_id
      render :new
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    render :new
  end

  def show
    @comment = Comment.find(params[:id])
    @comments = Comment.comments_by_parent_id
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_id)
  end

end
