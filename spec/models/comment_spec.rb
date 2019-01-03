require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
    comment = build_stubbed(:comment)
    expect(comment).to be_valid
  end
  describe Comment do
    it {is_expected.to validate_presence_of(:commentbody)}
  end
end
