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
      expect(response).to have_http_status(200)
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
      expect(response).to have_http_status(200)
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
    it "deletes a comment" do
      user_del = create(:user, password:"userdel")
      session[:user_id] = user_del.id
      post_del = create(:post, user_id: user_del.id)
      comment_del = create(:comment, post_id: post_del.id, user_id: user_del.id)
      post :destroy, params:{id: 1}, format: :json
      expect(response).to have_http_status(302)
    end
    it "updates a comment" do
      update_comment_user = create(:user, password:"commentUpdate")
      update_comment_post = create(:post, user_id: update_comment_user.id)
      comment_to_update = create(:comment, post_id: update_comment_post.id, user_id: update_comment_user.id)
      post :update, params: {id:1, commentbody: "Updated comment"}
      expect(response).to have_http_status(302)
    end
  end
  describe "reply" do
    it "creates a reply" do
      reply_user = create(:user, password: "reply")
      session[:user_id] = reply_user.id
      reply_post = create(:post, user_id: reply_user.id)
      comment_to_reply = create(:comment, post_id: reply_post.id)
      post :reply, params: {commentbody: "reply to comment", post_id: reply_post.id, comment_id: comment_to_reply.id}, format: :json
      expect(response).to have_http_status(302)
    end
    it "doesn't create a reply because there is no session user, redirects to login_path" do
      no_reply_user = create(:user, password: "replyFail")
      session[:user_id] = nil
      no_reply_post = create(:post, user_id: no_reply_user.id)
      no_reply_comment = create(:comment, post_id: no_reply_post.id)
      post :reply, params:{commentbody:"Fail", post_id: no_reply_post.id, comment_id: no_reply_comment.id}, format: :json
      expect(response).to redirect_to(login_path)
    end
    it "deletes a reply" do
      reply_user_del = create(:user, password:"userdel")
      session[:user_id] = reply_user_del.id
      reply_post_del = create(:post, user_id: reply_user_del.id)
      reply_comment_del = create(:comment, post_id: reply_post_del.id, user_id: reply_user_del.id)
      post :destroy, params: {id:1, post_id:1}, format: :json
      expect(response).to have_http_status(302)
    end
    it "updates a reply" do
      reply_update_user = create(:user, password:"replyUpdate")
      session[:user_id] = reply_update_user.id
      reply_update_post = create(:post, user_id: reply_update_user.id)
      reply_to_update = create(:comment, post_id: reply_update_post.id, user_id: reply_update_user.id, comment_id: 1)
      post :update, params:{id:1, commentbody: "updated reply"}
      expect(response).to have_http_status(302)
    end
  end





end
