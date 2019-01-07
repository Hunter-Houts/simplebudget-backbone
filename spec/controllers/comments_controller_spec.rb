require 'rails_helper'
require 'spec_helper'

RSpec.describe CommentsController do

  describe "index" do
    before do
    user = create(:user, password: "user")
    post = create(:post, user_id: user.id)
    other_comment = create(:comment, post_id: post.id)
    comment = create(:comment, post_id: post.id, comment_id: other_comment.id)
    end
    it "returns success status" do
      get :index, params: {id: 2}, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "show" do
    before do
    user2 = create(:user, password: "user2")
    post2 = create(:post, user_id: user2.id)
    comment2 = create(:comment, post_id: post2.id)
    end
    it "returns success status" do
      get :show, params: {id: 1}, format: :json
      expect(response).to have_http_status(:success)
    end
  end
  describe "create" do
    it "creates a new comment" do
      user_create = create(:user, password: "user_create")
      session[:user_id] = user_create.id
      post_create = create(:post, user_id: user_create.id)
      post :create, params:{commentbody: "new comment", post_id: post_create.id}, format: :json
      expect(response).to have_http_status(:created)
    end
  end




end
