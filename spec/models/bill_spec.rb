require 'rails_helper'

RSpec.describe Bill, type: :model do
  it "has a valid factory" do
    bill = build_stubbed(:bill)
    expect(bill).to be_valid
  end
  describe Bill do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:amount)}
  end
end
