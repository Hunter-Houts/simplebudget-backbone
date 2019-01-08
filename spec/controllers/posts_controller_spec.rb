require 'rails_helper'
require 'spec_helper'

RSpec.describe PostsController, :type => :controller do
  let(:current_user) {create(:user, password: "testpass")}
  before do
    user = create(:user, password:"any")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
  #Not sure about this one
  describe "create" do
    let(:params) do {
        post: {
          title: 'example title',
          body: 'example body'
        }
      }
    end
     before do
        user = create(:user, password:"any")
        session[:user_id] = user.id
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end
    it "creates a new post" do
      post :create, params: params, format: :json
      expect(response).to have_http_status(:created)
    end
  end
  ##########
  describe "show" do
    it "grabs the specific post" do
      post = FactoryBot.create(:post)
      get :show, params: {:id => post.id}
      expect(response).to have_http_status(200)
    end
  end
  describe "update" do
    let(:params) do {
      id: 1,
      post: {
        title: "new title"
      }

    }
  end
    before do
      user_for_update = create(:user, password:"updatePostUser")
      updatepost = FactoryBot.create(:post, :user_id => user_for_update.id)
      session[:user_id] = user_for_update.id
  end
  it "updates a post" do
    put :update, params: params, format: :json
    expect(response).to have_http_status(204) # Request processed successfully, no response body needed
    end
  end

  describe "destroy" do
    let(:params) do {
      id: 1
    }
    end
    before do
      user_for_destory = create(:user, password:"destoryPost")
      postDestory = FactoryBot.create(:post, :user_id => user_for_destory.id)
      session[:user_id] = user_for_destory.id
    end
    it "destorys the post" do
      post :destroy, params: params, format: :json
      expect(response).to redirect_to(posts_path)
    end
  end
end
