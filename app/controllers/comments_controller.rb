class CommentsController < ApplicationController
  respond_to :json

  # def params
  #   request.parameters
  # end

  def new
  end

  def index
    respond_with Comment.includes(:user).where(post_id: params[:id]).where.not(comment_id:  nil), include: {user: {user: :username}}
  end

  def show
    respond_with Comment.includes(:user).where(post_id: params[:id]), include: {user: {user: :username, user: :id}}
  end

  def create
    respond_with Comment.create(comment_params.merge(user_id: session[:user_id]))
  end

  def reply
    respond_with Comment.create(reply_params.merge(user_id: session[:user_id]))
  end

  def update
    if Comment.update(params[:id],update_params)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if Comment.destroy(params[:id])
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.permit(:commentbody,:post_id)
  end

  def update_params
    params.permit(:commentbody)
  end
  def reply_params
    params.permit(:commentbody, :post_id, :comment_id)
  end

end
