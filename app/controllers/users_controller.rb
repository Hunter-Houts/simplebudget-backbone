class UsersController < ApplicationController
  before_action :current_user, only: [:show]
  respond_to :json

  def index
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to login_path
    else
      render :json => User.includes(:account,:bills).find(session[:user_id]), include: {account: {account: :income, account: :option}, bills: {bills: :name, bills: :amount}}
    end
  end

  def new
  end

  def create
    @exsists ||= User.find_by_username(user_params[:username])
    if @exsists.nil?
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to(profile_path)
      else
        redirect_to(signup_path)
      end
    else
      redirect_to(signup_path)
    end
  end

  def show
    @current_user = User.find(session[:user_id])
    @user = User.find(params[:id])
    if @user.id != @current_user.id
      redirect_to(root_path)
    else
      render :json => User.find(params[:id])
    end
  end
  def update
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user = User.find(params[:id])
    if @current_user
      @exsists ||= User.find_by_username(update_params[:username])
      if @exsists.nil?
        if @user.id == @current_user.id
         @user = User.update(params[:id],update_params)
         if @user.update(update_params)
          redirect_to(profile_path)
        else
          redirect_to(user_path)
         end
        else
         redirect_to(login_path)
        end
      else
        redirect_to(profile_path)
      end
    else
      redirect_to(login_path)
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
