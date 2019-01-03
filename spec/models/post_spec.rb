require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has a valid factory" do
    post = build_stubbed(:post)
    expect(post).to be_valid
  end
  describe Post do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:body)}
  end
end
