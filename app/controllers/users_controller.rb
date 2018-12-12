class UsersController < ApplicationController
  respond_to :json

  # def params
  #   request.parameters
  # end]
  def new
  end

  def create
    @user = User.create(user_params)
    # TODO: fixed the three times creating same user error, now need to figure out how to add user to session.
    if @user.save
      session[:user_id] = @user.id
      redirect_to(profile_path)
    else
      redirect_to(signup_path)
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    params.permit(:username, :email, :phonenumber, :password)
  end
end
