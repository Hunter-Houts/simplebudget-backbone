class AccountsController < ApplicationController
  before_action :current_user
  respond_to :json

  def params
    request.parameters
  end
  def index
    render :json => Account.find_by_user_id(session[:user_id])
  end

  def new
  end

  def create
    respond_with Account.create(params[:account].merge(user_id: session[:user_id]))
  end

  def show
    respond_with Account.find(params[:id])
  end

  def update
    respond_with Account.update(params[:id], params[:account])
  end

end
