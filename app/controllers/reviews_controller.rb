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
    redirect_to(root_path)
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
