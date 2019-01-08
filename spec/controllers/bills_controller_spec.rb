require 'rails_helper'
require 'spec_helper'

RSpec.describe BillsController do
  describe "index" do
    before do
      user = create(:user, password: "billIndex")
      session[:user_id] = user.id
      bill = create(:bill, user_id: user.id)
    end
    it "returns success status" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end
  end
  describe "create" do
    before do
      user_create = create(:user, password:"billCreate")
      session[:user_id] = user_create.id
    end
    it "creates a bill" do
      post :create, params: {bill: {name: "test", amount: 200.00}}
      expect(response).to have_http_status(302)
    end
  end
  describe "destroy" do
    it "deletes a bill" do
      user_del = create(:user, password:"billDel")
      bill_del = create(:bill, user_id: user_del.id)
      post :destroy, params: {id:1}
      expect(response).to have_http_status(302)
    end
  end
end
