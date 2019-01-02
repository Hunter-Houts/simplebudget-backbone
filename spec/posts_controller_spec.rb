require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  describe "GET #index" do

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "Contains JSON About Posts" do
      json_response = JSON.parse(response.body.to_json).first
      expect(hash_body.keys).to match_array([:id, :title, :body, :user_id, :comment_id, :created_at, :updated_at, :user])
    end
  end
end
