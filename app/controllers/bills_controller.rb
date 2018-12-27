class BillsController < ApplicationController

  def params
    request.parameters
  end

  def index
    render :json => Bill.where(:user_id => session[:user_id]).all
  end

  def create
    respond_with Bill.create(params[:bill].merge(user_id: session[:user_id]))
  end

  def destroy
    respond_with Bill.destroy(params[:id])
  end

end
