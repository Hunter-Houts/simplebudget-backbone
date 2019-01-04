require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, :type => :controller do
  describe "index" do
    before do
      user = create(:user, password: "new")
      session[:user_id] = user.id
    end
    it "returns logged in user profile" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

 describe "create" do
    #test passes, but it does not redirect_to said path, it actually goes to login via backbone.
    it "creates a new user and controller redirects to profile_path" do
      post :create, params: {username: "TestCreateUser", email: "testCreateEmail@email.com", password: "testcreateuser"}, format: :json
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(profile_path)
    end
  end

  describe "show" do
    before do
      user_show = create(:user, password: 'show')
      session[:user_id] = user_show.id
    end
    it "gets user show/edit page if data belongs to that user" do
      get :show, params: {id: 1}, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "update" do
    before do
      user_update = create(:user, password:"update")
      session[:user_id] = user_update.id
    end
    it "Changes user information" do
      patch :update, params: {id: 1, username: "updatedUsername"}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(profile_path)
    end
  end

end
