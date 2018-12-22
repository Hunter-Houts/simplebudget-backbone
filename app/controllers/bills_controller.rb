class BillsController < ApplicationController
  def index
    render :json => Bill.where(:user_id => session[:user_id]).all
  end
end
