require 'rails_helper'

RSpec.describe Account, type: :model do
  it "has a valid factory" do
    account = build_stubbed(:account)
    expect(account).to be_valid
  end
  describe Account do
    it {is_expected.to validate_presence_of(:income)}
    it {is_expected.to validate_presence_of(:option)}
  end
end
