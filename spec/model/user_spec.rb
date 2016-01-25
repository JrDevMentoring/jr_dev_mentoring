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

  describe "ClassMethods" do
    before :all do
      mentor_plan = FactoryGirl.create(:plan, :mentor)
      mentee_plan = FactoryGirl.create(:plan, :mentee)

      @mentors = FactoryGirl.create_list(:user, 3, plan: mentor_plan)
      @mentees = FactoryGirl.create_list(:user, 4, plan: mentee_plan)

      @mentors.each_with_index do |mentor, index|
        not_available = (index == 0 ? true : false)
        FactoryGirl.create(:profile, user: mentor, not_available: not_available)
      end

      @mentees.each_with_index do |mentee, index|
        not_available = (index == 0 ? true : false)
        FactoryGirl.create(:profile, user: mentee, not_available: not_available)
      end

      @available_mentors = User.mentors
      @available_mentees = User.mentees
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