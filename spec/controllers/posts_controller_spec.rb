require 'rails_helper'
require 'spec_helper'

RSpec.describe '/posts', :type => :request do
  let(:current_user) {create(:user, password: "testpass")}
  before do
    user = create(:user, password:"any")
    allow_any_instance_of(PostsController).to receive(:current_user) {user}
  end

  describe "index" do

    it "returns http success" do
      get '/posts'
      expect(response).to have_http_status(:success)
    end
    it "renders template" do
      get '/posts'
      response.should render_template('main/index', 'layouts/application')
    end
  end
  #Not sure about this one
  describe "create" do
     before do
        user = create(:user, password:"any")
        allow_any_instance_of(PostsController).to receive(:current_user) {user}
      end
    it "creates a new post" do
      post '/posts/create', params: {'title' => 'testcreate', 'body' => 'testcreatebody'}.to_json
      expect(response).to have_http_status(:created)
    end
  end
  ##########
  describe "show" do
    it "grabs the specific post" do
      post = FactoryBot.create(:post)
      get '/posts/' + post.id.to_s
      expect(response).to have_http_status(:success)
    end
  end

end
