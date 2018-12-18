class ReviewsController < ApplicationController
  before_action :current_user
    respond_to :json

  def params
    request.parameters
  end
  # TODO: Fix problem when directly going to /reviews in url
  def index
    respond_with Review.includes(:user).all, include: {user: {only: :username}}
  end

  def show
    @current_user = User.find(session[:user_id])
    @review = Review.find_by_user_id(current_user.id)
    if @review
      render :json => Review.includes(:user).find(params[:id]), include: {user: {user: :username, user: :id}}
    else
      redirect_to(root_path)
    end
  end

  def new
    @new_review = Review.new
    redirect_to(review_path)
  end
  # TODO: Fix this, only saves user value nothing else.
  def create
    @current_user = User.find(session[:user_id])
    @review = Review.create(params[:review])
    @review.user = @current_user
    if @review.save
      redirect_to(root_path)
    else
      redirect_to(review_path)
    end
  end

  def update
    respond_with Review.update(params[:id], params[:review])
  end

  def destroy
    respond_with Review.destroy(params[:id])
  end
end
