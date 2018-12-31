class ReviewsController < ApplicationController
  respond_to :json

  def params
    request.parameters
  end

  def index
    respond_with Review.includes(:user).all, include: {user: {only: :username}}
  end

  def show
    # @current_user = User.find(session[:user_id])
    # @review = Review.find_by_user_id(current_user.id)
    # if @review
    @review = Review.find(params[:id])
      render :json => Review.find(params[:id])
    # else
    #   redirect_to(root_path)
    # end
  end

  def new
  end

  def create
    @review = Review.create(params[:review].merge(user_id: session[:user_id]))
    if @review.save
      redirect_to(root_path)
    else
      redirect_to(reviews_path)
    end
  end

  def update
    respond_with Review.update(params[:id], params[:review])
  end

  def destroy
    respond_with Review.destroy(params[:id])
  end

  # private
  # def review_params
  #   params.permit(:review)
  # end
end
