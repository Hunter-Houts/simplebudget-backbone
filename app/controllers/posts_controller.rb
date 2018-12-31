class PostsController < ApplicationController
  before_action :current_user
  respond_to :json

  def params
    request.parameters
  end

  def index
    render :json => Post.includes(:user).all, include: {user: {only: :username}}
  end

  def new
  end

  def show
    render :json => Post.includes(:user,:comments).where(comment_id: nil).find(params[:id]), include: {user: {user: :username, user: :id}, comments: {comments: :commentbody}}
  end

  def create
    respond_with Post.create(params[:post].merge(user_id: session[:user_id]))
  end

  def update
    respond_with Post.update(params[:id], params[:post])
  end

  def destroy
    if Post.destroy(params[:id])
      redirect_to(posts_path)
    end
  end
end
