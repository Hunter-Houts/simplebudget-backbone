class SessionsController < ApplicationController
  respond_to :json
  after_action :set_csrf_header, only: [:new, :create, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      return redirect_to(profile_path)
    else
      puts "LOOK HERE"
      redirect_to(login_path)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  protected

  def set_csrf_header
    response.headers['X-CSRF-Token'] = form_authenticity_token
  end
end
