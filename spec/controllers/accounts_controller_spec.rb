require 'rails_helper'
require 'spec_helper'

RSpec.describe AccountsController do
  describe "index" do
    before do
      user = create(:user, password:"index")
      session[:user_id] = user.id
    end
    it "returns success if there is a session user" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end
    it "redirects to root if no session user" do
      session[:user_id] = nil
      get :index, format: :json
      expect(response).to redirect_to(root_path)
    end
  end

  describe "create" do
    before do
      user_create = create(:user, password:"createAccount")
      session[:user_id] = user_create.id
    end
    it "creates an account" do
    post :create, params: {account: {income: 500, option: 1}}, format: :json
    expect(response).to have_http_status(:created)
    end
  end
  describe "update" do
    before do
      user_update = create(:user, password: "updateAccount")
      session[:user_id] = user_update.id
      account_to_update = create(:account, user_id: user_update.id)
    end
    it "updates an account" do
      put :update, params:{id:1, account:{income:400, option:1}}, format: :json
      expect(response).to have_http_status(204)
    end
  end
end
