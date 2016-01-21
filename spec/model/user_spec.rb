require 'rails_helper'

describe User do
  it "should have a valid factory" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  describe "Validation" do
    it "should test to see if Devise is requiring email" do
      user = FactoryGirl.build(:user, email: nil)
      expect{ user.save }.not_to change(User, :count)
      expect(user.errors[:email]).to be_present
    end

    it "should test to see if Devise is requiring password" do
      user = FactoryGirl.build(:user, password: nil)
      expect{ user.save }.not_to change User, :count
      expect(user.errors[:password]).to be_present
    end

    it "should allow the provided email and password to be saved to the database" do
      user = FactoryGirl.build(:user)
      expect{user.save}.to change(User, :count).by(1)
      expect(user.errors[:email]).not_to be_present
      expect(user.errors[:password]).not_to be_present
    end

    it "should test to make sure every user is assigned to a plan_id" do
      user = FactoryGirl.build(:user, plan_id: nil)
      expect{user.save}.not_to change(User, :count)
      expect(user.errors[:plan_id]).to be_present
    end
  end

  describe "Association" do
    describe "plan" do
      it 'belong_to a user' do
        plan = FactoryGirl.create(:plan, :mentor)
        user = FactoryGirl.build(:user, plan: plan)
        expect(user.plan.name).to eq "mentor"
      end
    end
    describe "profile" do
      it "user has_one" do
        profile = FactoryGirl.create(:profile)
        user = FactoryGirl.build(:user, profile: profile)
        expect(user.profile).to eq profile
      end
    end
  end

  describe "#Mentors" do
    it "lists all available mentors" do

    end

    it "doesn't list unavailable mentors" do

    end
  end
  describe "#Mentees" do
    it "lists all available mentees" do

    end

    it "doesn't list unavailable mentees" do

    end
  end
end