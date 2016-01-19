require 'rails_helper'

describe Plan do
  it "should have a valid factory" do
    plan = FactoryGirl.build(:plan)
    expect(plan).to be_valid
  end
end