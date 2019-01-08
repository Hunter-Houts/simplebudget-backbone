class AccountsController < ApplicationController
  before_action :current_user
  respond_to :json

  def params
    request.parameters
  end
  def index
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      render :json => Account.find_by_user_id(session[:user_id])
    else
      redirect_to(root_path)
    end
  end

  def new
  end

  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      respond_with Account.create(params[:account].merge(user_id: session[:user_id]))
    else
      redirect_to(root_path)
    end
  end

  def show
    respond_with Account.find(params[:id])
  end

  def update
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @account ||= Account.find(params[:id])
    if @account.user.id == @current_user.id
      respond_with Account.update(params[:id], params[:account])
    else
      redirect_to(root_path)
    end
  end

end
