require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  skip_before_action :verify_authenticity_token
  include ActionController::MimeResponds
  helper_method :current_user
  helper_method :has_review
  # before_action :coerce_json

  # def coerce_json
  #   # Rails converts the following header:
  #   #
  #   # Accept: application/json, text/javascript, */*; q=0.01
  #   #
  #   # into text/html. Force it back to json.
  #   if request.headers[ 'HTTP_ACCEPT' ] =~ /^\s*application\/json/
  #     request.format = 'json'
  #   end
  # end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def has_review
    @has_review ||= Review.find_by_user_id(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end
end
