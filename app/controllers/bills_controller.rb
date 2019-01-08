class BillsController < ApplicationController

  def params
    request.parameters
  end

  def index
    render :json => Bill.where(:user_id => session[:user_id]).all
  end

  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      respond_with Bill.create(params[:bill].merge(user_id: session[:user_id]))
    else
      redirect_to(login_path)
    end
  end

  def destroy
    respond_with Bill.destroy(params[:id])
  end

end
