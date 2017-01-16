require 'rails_helper'

describe Profile do
  it "should have a valid factory" do
    profile = FactoryGirl.build(:profile)
    puts profile.errors.full_messages
    expect(profile).to be_valid
  end

  describe "Validation" do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :contact_email }
    it { is_expected.to validate_presence_of :bio }

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

    it "should test to see if the user's input for coding_languages meets the required max of 500" do
      profile = FactoryGirl.build(:profile, coding_languages: SecureRandom.hex(251) )
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:coding_languages]).to be_present
    end

    it "should test to see if the user's input for mentoring_needs meets the required min of 1" do
      profile = FactoryGirl.build(:profile, mentoring_needs: "")
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:mentoring_needs]).to be_present
    end

    it "should test to see if the user's input for mentoring_needs meets the required max of 500" do
      profile = FactoryGirl.build(:profile, mentoring_needs: SecureRandom.hex(251) )
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

  describe "Association" do
    describe "profile" do
      it 'belong_to a user' do
        profile = FactoryGirl.create(:profile)
        user = FactoryGirl.build(:user, profile: profile)
        expect(user.profile).to eq profile
      end
    end
  end
end