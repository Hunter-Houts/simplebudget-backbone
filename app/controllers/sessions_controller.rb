class SessionsController < ApplicationController
  respond_to :json
  after_action :set_csrf_header, only: [:new, :create, :destroy]

  def new
    respond_with User.new
  end

  def create
    respond_with User.find_by_username(params[:session][:username])
    if User.find_by_username(params[:session][:username]) && User.find_by_username(params[:session][:username]).authenticate(params[:session][:password])
      session[:user_id] = User.find_by_username(params[:session][:username]).id
      redirect_to '/profile'
    else
      redirect_to 'login'
    end
  end

  def destroy
    respond_with session[:user_id] = nil
    redirect_to '/'
  end
  protected

  def set_csrf_header
    response.headers['X-CSRF-Token'] = form_authenticity_token
  end
end
