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
    render :json => User.includes(:account,:bills).find(params[:id]), include: {account: {account: :income, account: :option}, bills: {bills: :name, bills: :amount}}
  end

  private
  def user_params
    params.permit(:username, :email, :phonenumber, :password)
  end
end
