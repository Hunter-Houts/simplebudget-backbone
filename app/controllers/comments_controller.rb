class CommentsController < ApplicationController
  respond_to :json

  # def params
  #   request.parameters
  # end

  def new
  end

  def index
    respond_with Comment.includes(:user).where(post_id: params[:id]).where.not(comment_id: nil), include: {user: {user: :username}}
  end

  def show
    respond_with Comment.includes(:user).where(post_id: params[:id]).where(comment_id: nil), include: {user: {user: :username, user: :id}}
  end

  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      respond_with Comment.create(comment_params.merge(user_id: session[:user_id]))
    else
      redirect_to(login_path)
    end
  end

  def reply
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @comment = Comment.find_by(:id => params[:comment_id])
    @post = Post.find_by(:id => params[:post_id])
    if @current_user and @comment and @post
      if Comment.create(reply_params.merge(user_id: session[:user_id]))
        redirect_back(fallback_location: root_path)
      end
    else
      if @current_user.nil?
        redirect_to(login_path)
      elsif @comment.nil?
        redirect_back(fallback_location: root_path)
      elsif @post.nil?
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def update
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @comment = Comment.find_by(:id => params[:id])
    if @current_user
      if @comment.user.id == @current_user.id
        if Comment.update(params[:id],update_params)
        redirect_back(fallback_location: root_path)
        end
      else
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_to(login_path)
    end
  end

  def destroy
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @comment = Comment.find_by(:id => params[:id])
    if @current_user
      if @current_user.id == @comment.user.id
        if Comment.destroy(params[:id])
          redirect_back(fallback_location: root_path)
        end
      else
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_to(login_path)
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
