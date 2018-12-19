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
    render :json => Post.includes(:user,:comments).find(params[:id]), include: {user: {user: :username, user: :id}, comments: {comments: :commentbody, comments: :comments}}
  end

  def create
    respond_with Post.create(params[:post].merge(user_id: session[:user_id]))
  end

  def update
    respond_with Post.update(params[:id], params[:post])
  end

  def destroy
    respond_with Post.destroy(params[:id])
  end
end
