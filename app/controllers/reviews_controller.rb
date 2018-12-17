class ReviewsController < ApplicationController
  before_action :current_user
    respond_to :json

  def params
    request.parameters
  end
  # TODO: Fix problem when directly going to /reviews in url
  def index
    render :json => Review.includes(:user).all, include: {user: {only: :username}}
  end

  def new
    @new_review = Review.new
    redirect_to(review_path)
  end

  def create
    @current_user = User.find(session[:user_id])
    respond_with Review.create!(params[:review,:current_user])
  end

  def update
    respond_with Review.update(params[:id], params[:review])
  end

  def destroy
    respond_with Review.destroy(params[:id])
  end
end
