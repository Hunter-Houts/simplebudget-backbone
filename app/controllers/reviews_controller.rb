class ReviewsController < ApplicationController
  respond_to :json

  def params
    request.parameters
  end

  def index
    respond_with Review.includes(:user).all, include: {user: {only: :username}}
  end

  def show
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @review = Review.find(params[:id])
    if @review.user.id == @current_user.id
      render :json => Review.find(params[:id])
    else
      redirect_to(root_path)
    end
  end

  def new
  end

  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      @exsiting_review ||= Review.find_by_user_id(@current_user.id)
      if @exsiting_review.nil?
        @review = Review.create(params[:review].merge(user_id: session[:user_id]))
        if @review.save
          redirect_to(root_path)
        else
          redirect_to(reviews_path)
        end
      else
        redirect_to '/reviews/' + @exsiting_review.id.to_s
      end
    end
  end

  def update
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @review = Review.find(params[:id])
    if @review.user.id == @current_user.id
      respond_with Review.update(params[:id], params[:review])
    else
      redirect_to(root_path)
    end
  end

  def destroy
    respond_with Review.destroy(params[:id])
  end

  # private
  # def review_params
  #   params.permit(:review)
  # end
end
