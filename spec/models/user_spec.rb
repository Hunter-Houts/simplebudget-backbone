require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user = build_stubbed(:user, password: "example")
    expect(user).to be_valid
  end
  describe User do
    it {is_expected.to validate_presence_of(:username)}
    it {is_expected.to validate_presence_of(:email)}
  end
end
