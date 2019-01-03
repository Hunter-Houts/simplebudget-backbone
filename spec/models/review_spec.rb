require 'rails_helper'

RSpec.describe Review, type: :model do
  it "has a valid factory" do
    review = build_stubbed(:review)
    expect(review).to be_valid
  end
  describe Review do
    it {is_expected.to validate_presence_of(:rating)}
    it {is_expected.to validate_presence_of(:body)}
  end
end
