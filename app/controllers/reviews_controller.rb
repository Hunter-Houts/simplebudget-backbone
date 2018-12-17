class ReviewsController < ApplicationController
    respond_to :json
  # TODO: Fix problem when directly going to /reviews in url
  def index
    render :json => Review.includes(:user).all, include: {user: {only: :username}}
  end

  def create
    respond_with Review.create(params[:review])
  end

  def update
    respond_with Review.update(params[:id], params[:review])
  end

  def destroy
    respond_with Review.destroy(params[:id])
  end
end
