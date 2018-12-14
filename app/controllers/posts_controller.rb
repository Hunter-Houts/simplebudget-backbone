class PostsController < ApplicationController
  before_action :current_user
  respond_to :json
  # TODO: Fix problem when directly going to /posts in url
  def index
    render :json => Post.includes(:user).all, include: {user: {only: :username}}
  end
#TODO: Find a way to pass helper method to view.
  def show
    @current_user = :current_user
    render :json => Post.includes(:user,:comments).find(params[:id]), include: {user: {user: :username, user: :id}}
  end

  def create
    respond_with Post.create(params[:post])
  end

  def update
    respond_with Post.update(params[:id], params[:post])
  end

  def destroy
    respond_with Post.destroy(params[:id])
  end
end
