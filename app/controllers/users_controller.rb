class UsersController < ApplicationController
  respond_to :html, :json

  # def params
  #   request.parameters
  # end

  def create
    respond_with User.create(user_params)
    # TODO: fixed the three times creating same user error, now need to figure out how to add user to session.
    # if User.create(user_params).save
    #   session[:user_id] = User.create(user_params).id
    #   redirect_to(profile_path)
    # else
    #   redirect_to(signup_path)
    # end
  end

  def show
    respond_with User.find(session[:user_id])
  end

  private
  def user_params
    params.permit(:username, :email, :phonenumber, :password)
  end
end
