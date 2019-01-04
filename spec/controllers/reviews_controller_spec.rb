require 'rails_helper'
require 'spec_helper'

RSpec.describe ReviewsController, :type => :controller do
  describe "index" do
    it "returns success on get index" do
      expect(response).to have_http_status(:success)
    end
  end
end
