class SessionsController < ApplicationController
  respond_to :json
  after_action :set_csrf_header, only: [:new, :create, :destroy]

  def new
    @user = User.new
    render 'javascripts/templates/users/login.hbs'
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = User.find_by_username(params[:session][:username]).id
      redirect_to '/profile'
    else
      redirect_to 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
  protected

  def set_csrf_header
    response.headers['X-CSRF-Token'] = form_authenticity_token
  end
end
