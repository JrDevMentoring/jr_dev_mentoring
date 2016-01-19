require 'rails_helper'

describe Profile do
  it "should have a valid factory" do
    profile = FactoryGirl.build(:profile)
    puts profile.errors.full_messages
    expect(profile).to be_valid
  end

  describe "Validation" do
    it "should test to see if first_name is present" do
      profile = FactoryGirl.build(:profile, first_name: nil)
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:first_name]).to be_present
    end

    it "should test to see if last_name is present" do
      profile = FactoryGirl.build(:profile, last_name: nil)
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:last_name]).to be_present
    end

    it "should test to see if email is present" do
      profile = FactoryGirl.build(:profile, contact_email: nil)
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:contact_email]).to be_present
    end

    it "should test to see if bio is present" do
      profile = FactoryGirl.build(:profile, bio: nil)
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:bio]).to be_present
    end

    it "should test to see if mentoring_needs is present" do
      profile = FactoryGirl.build(:profile, mentoring_needs: nil)
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:mentoring_needs]).to be_present
    end

    it "should test to see if the user's input for coding_languages meets the required min of 1" do
      profile = FactoryGirl.build(:profile, coding_languages: "")
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:coding_languages]).to be_present
    end

    it "should test to see if the user's input for coding_languages meets the required max of 1000" do
      profile = FactoryGirl.build(:profile, coding_languages: SecureRandom.hex(501) )
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:coding_languages]).to be_present
    end

    it "should test to see if the user's input for mentoring_needs meets the required min of 1" do
      profile = FactoryGirl.build(:profile, mentoring_needs: "")
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:mentoring_needs]).to be_present
    end

    it "should test to see if the user's input for mentoring_needs meets the required max of 1000" do
      profile = FactoryGirl.build(:profile, mentoring_needs: SecureRandom.hex(501) )
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:mentoring_needs]).to be_present
    end

    it "should test to see if the user's input for bio meets the required min of 1" do
      profile = FactoryGirl.build(:profile, bio: "")
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:bio]).to be_present
    end

    it "should test to see if the user's input for bio meets the required max of 1000" do
      profile = FactoryGirl.build(:profile, bio: SecureRandom.hex(501) )
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:bio]).to be_present
    end
  end
end