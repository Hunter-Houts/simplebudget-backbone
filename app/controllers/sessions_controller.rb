class SessionsController < ApplicationController
  respond_to :json
  def new
    respond_with User.new
  end

  def create
    respond_with @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/profile'
    else
      redirect_to 'login'
    end
  end

  def destroy
    respond_with session[:user_id] = nil
    redirect_to '/'
  end
end
