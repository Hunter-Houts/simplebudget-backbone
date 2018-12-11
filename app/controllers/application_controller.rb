class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include ActionController::MimeResponds
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end
end
