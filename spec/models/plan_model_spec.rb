require 'rails_helper'

describe Plan do
  it "should have a valid factory" do
    plan = FactoryGirl.build(:plan)
    expect(plan).to be_valid
  end
end

describe "Association" do
  describe "plan" do
    it 'has_many users' do
      plan = FactoryGirl.create(:plan)
      user = FactoryGirl.build(:user, plan: plan)
      expect(user.plan).to eq plan
    end
  end
end