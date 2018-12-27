class UsersController < ApplicationController
  before_action :current_user, only: [:show]
  respond_to :json

  def index
    # render :json =>  User.includes(:account, :bills).all, include: {account: {account: :income, account: :bills}, bills: {bills: :name, bills: :amount}}
    render :json => User.includes(:account,:bills).find(session[:user_id]), include: {account: {account: :income, account: :option}, bills: {bills: :name, bills: :amount}}
  end

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(profile_path)
    else
      redirect_to(signup_path)
    end
  end

  def show
    render :json => User.find(params[:id])
  end
  def update
    @user = User.update(params[:id],update_params)
    if @user.update(update_params)
      redirect_to(profile_path)
    else
      redirect_to(user_path)
    end
  end

  private
  def user_params
    params.permit(:username, :email, :password)
  end
  def update_params
    params.permit(:username, :email, :password)
  end
end
