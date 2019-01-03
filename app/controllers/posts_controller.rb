class PostsController < ApplicationController
  before_action :current_user
  respond_to :json

  def params
    request.parameters
  end

  def index
    render :json => Post.includes(:user).all, include: {user: {only: :username}}
  end

  def new
  end

  def show
    render :json => Post.includes(:user,:comments).where(comment_id: nil).find(params[:id]), include: {user: {user: :username, user: :id}, comments: {comments: :commentbody}}
  end

  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      respond_with Post.create(params[:post].merge(user_id: session[:user_id]))
    else
      redirect_to(root_path)
    end
  end

  def update
    @current_user = User.find(session[:user_id])
    @post = Post.find(params[:id])
    if @post.user.id == @current_user.id
      respond_with Post.update(params[:id], params[:post])
    else
      redirect_to(root_path)
    end
  end

  def destroy
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @post = Post.find(params[:id])
    if @post.user.id == @current_user.id
      if Post.destroy(params[:id])
        redirect_to(posts_path)
      end
    else
      redirect_to(root_path)
    end
  end

  def search
    url = request.referer
    url_params = URI(url).query
    parsed = Rack::Utils.parse_query url_params
    render :json => Post.includes(:user).where("title like ? or body like ?", "%#{parsed['search']}%", "%#{parsed['search']}%"), include: {user: {only: :username}}
  end
end
