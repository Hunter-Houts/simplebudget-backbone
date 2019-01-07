require 'rails_helper'
require 'spec_helper'

RSpec.describe ReviewsController, :type => :controller do
  describe "index" do
    it "returns success on get index" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "show" do
    before do
      show_user = create(:user, password:"show")
      session[:user_id] = show_user.id
      review = create(:review, user_id: show_user.id)
    end
    it "Sucessfully grabs data if session user id and review user id match" do
      get :show, params: {id: 1}, format: :json
      expect(response).to have_http_status(:success)
    end
    it "redirects if session user id doesn't match review user id" do
      wrong_user = create(:user, password:"wrong")
      session[:user_id] = wrong_user.id
      get :show, params: {id: 1}, format: :json
      expect(response).to redirect_to(root_path)
    end
  end

  describe "create" do
    let(:params) do {
      review: {
        rating: 5,
        body: "Amazing!"
      }
    }
    end
    before do
      create_user = create(:user, password: "create")
      session[:user_id] = create_user.id
    end
    it "creates a review" do
      post :create, params: params, format: :json
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path) #backbone actaully redirects this to /reviews
    end
    it "fails to create a review because empty params" do
      post :create, params: {review: {rating: 1, body: ""}}, format: :json
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(reviews_path) #backone actually takes you to root_path
    end
    it "redirects to edit page if user already has a review" do
      user_has_review = create(:user, password:"exsiting_review")
      review_exsits = create(:review, user_id: user_has_review.id)
      session[:user_id] = user_has_review.id
      post :create, params: params, format: :json
      expect(request).to redirect_to('/reviews/' + review_exsits.id.to_s)
    end
  end

  describe "update" do
    let(:params) do {
      id: 1,
      review: {
        rating: 5,
        body: "updated"
      }
    }
    end
    before do
      update_user = create(:user, password:"reviewUpdate")
      review_to_update = create(:review, user_id: update_user.id)
      session[:user_id] = update_user.id
    end
    it "updates a existing review if session user id equals review user id" do
      put :update, params: params, format: :json
      expect(response).to have_http_status(204)
    end
    it "redirects user if review doesn't belong to session user" do
      not_review_user = create(:user, password:"not_review_user")
      session[:user_id] = not_review_user.id
      put :update, params: params, format: :json
      expect(response).to redirect_to(root_path)
    end
  end





end
