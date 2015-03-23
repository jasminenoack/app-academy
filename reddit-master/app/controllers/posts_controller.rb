class PostsController < ApplicationController
  before_action :require_author, only: [:edit, :update]
  before_action :require_logged_in, except: :show

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      @subs = Sub.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all
  end

  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.comments_by_parent_id
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      @subs = Sub.all
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:content, :title, :url, :sub_ids => [])
    end

    def require_author
      post = Post.find(params[:id])
      unless current_user.id == post.author_id
        flash[:error] = "You are not the author"
        redirect_to post_url(post)
      end
    end

end
