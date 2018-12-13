class PostsController < ApplicationController
  # module current_user end
  respond_to :json
  # TODO: Fix problem when directly going to /posts in url
  def index
    render :json => Post.includes(:user).all, include: {user: {only: :username}}
  end
#TODO: Find a way to pass helper method to view.
  def show
    render :json => Post.includes(:user,:comments, @current_user).find(params[:id])
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
