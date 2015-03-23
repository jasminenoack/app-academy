class SubsController < ApplicationController
  before_action :require_moderator, only: [:edit, :update]
  before_action :require_logged_in, except: [:show, :index]

  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def show
    @sub = Sub.find(params[:id])
    @posts = @sub.posts
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      render :edit
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_moderator
    sub = Sub.find(params[:id])
    unless sub.moderator_id == current_user.id
      redirect_to sub_url(sub)
    end
  end
end
