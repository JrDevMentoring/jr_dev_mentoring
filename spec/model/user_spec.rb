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
  end

end