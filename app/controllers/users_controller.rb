class UsersController < ApplicationController
  respond_to :json

  def params
    request.parameters
  end

end
