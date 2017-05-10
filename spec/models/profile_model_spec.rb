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

    it "should test to see if mentoring_needs is present for mentees" do
      profile = FactoryGirl.build(:profile, :mentee, mentoring_needs: nil)
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
      profile = FactoryGirl.build(:profile, :mentee, mentoring_needs: "")
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:mentoring_needs]).to be_present
    end

    it "should test to see if the user's input for mentoring_needs meets the required max of 500" do
      profile = FactoryGirl.build(:profile, :mentee, mentoring_needs: SecureRandom.hex(251) )
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

  describe '#mentor?' do
    it 'is true for user with a mentor profile plan' do
      profile = create(:profile, :mentor)
      expect(profile.mentor?).to be_truthy
    end

    it 'is false for user with no mentor profile plan' do
      profile = create(:profile)
      expect(profile.mentor?).to be_falsey
    end
  end

  describe '#mentee?' do
    it 'is true for user with a mentee profile plan' do
      profile = create(:profile, :mentee)
      expect(profile.mentee?).to be_truthy
    end

    it 'is false for user with no mentee profile plan' do
      profile = create(:profile)
      expect(profile.mentee?).to be_falsey
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

  describe "ClassMethods" do
    before :all do
      DatabaseCleaner.start
      mentor_users = create_list(:user, 3)
      mentee_users = create_list(:user, 4)
      @mentors = []
      @mentees = []
      mentor_users.each_with_index do |mentor, index|
        not_available = (index == 0 ? true : false)
        @mentors << FactoryGirl.create(:profile, :mentor, user: mentor, not_available: not_available)
      end

      mentee_users.each_with_index do |mentee, index|
        not_available = (index == 0 ? true : false)
        @mentees << FactoryGirl.create(:profile, :mentee, user: mentee, not_available: not_available)
      end

      @available_mentors = Profile.mentors
      @available_mentees = Profile.mentees
    end

    after :all do
      DatabaseCleaner.clean
    end

    describe "#Mentors" do
      it "lists all available mentors" do
        expect(@available_mentors.count).to eq 2
      end

      it "doesn't list mentees" do
        expect(@available_mentors).not_to include @mentees[0]
      end

      it "lists mentors" do
        expect(@available_mentors).to include @mentors[1]
      end

      it "doesn't list unavailable mentors" do
        expect(@available_mentors).not_to include @mentors[0]
      end

    end

    describe "#Mentees" do
      it "lists all available mentees" do
        expect(@available_mentees.count).to eq 3
      end

      it "doesn't list mentors" do
        expect(@available_mentees).not_to include @mentors[1]
      end

      it "lists mentors" do
        expect(@available_mentees).to include @mentees[1]
      end
      it "doesn't list unavailable mentees" do
        expect(@available_mentees).not_to include @mentees[0]
      end
    end
  end
end