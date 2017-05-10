require 'rails_helper'

describe CommunitiesController do

  describe 'GET#index' do
    describe 'unauthenticated user' do
      it 'gets redirected' do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'for authenticated user, basic search' do
      before :each do
        mentors = create_list(:user, 3)
        mentees = create_list(:user, 4)

        mentors.each do |mentor|
          FactoryGirl.create(:profile, :mentor, user: mentor)
        end

        mentees.each do |mentee|
          FactoryGirl.create(:profile, :mentee, user: mentee)
        end

        @available_mentors = Profile.mentors
        @available_mentees = Profile.mentees


        user = create(:profile, plan_types: ['mentor', 'mentee']).user
        sign_in user
        get :index
      end

      it 'is a success' do
        expect(response.status).to eq 200
      end

      it 'assigns all mentors as "mentors"' do
        expect(assigns[:available_mentors]).to eq @available_mentors
      end

      it 'assigns all mentees as "mentees"' do
        expect(assigns[:available_mentees]).to eq @available_mentees
      end
    end

    describe 'for authenticated user, language search' do
      before :each do
        mentors = create_list(:user, 3)
        mentees = create_list(:user, 4)

        search_users = create_list(:user, 4)

        mentors.each do |mentor|
          FactoryGirl.create(:profile, :mentor, user: mentor)
        end

        mentees.each do |mentee|
          FactoryGirl.create(:profile, :mentee, user: mentee)
        end

        @ruby_mentor = FactoryGirl.create(:profile, :mentor,
                                          user: search_users[0],
                                          coding_languages: "ruby")
        @ruby_mentee = FactoryGirl.create(:profile, :mentee,
                                          user: search_users[0],
                                          coding_languages: "ruby")

        @python_mentor = FactoryGirl.create(:profile, :mentor,
                                            user: search_users[2],
                                            coding_languages: "python")
        @python_mentee = FactoryGirl.create(:profile, :mentee,
                                            user: search_users[3],
                                            coding_languages: "python")

        @available_mentors = Profile.mentors
        @available_mentees = Profile.mentees


        user = create(:profile, plan_types: ['mentor', 'mentee']).user
        sign_in user
        get :index, query: 'ruby'
      end

      it 'is a success' do
        expect(response.status).to eq 200
      end

      it 'assigns correct mentors' do
        expect(assigns[:available_mentors]).to include @ruby_mentor
      end

      it 'does not assign incorrect mentors' do
        expect(assigns[:available_mentors]).not_to include @python_mentor
      end

      it 'assigns correct mentees' do
        expect(assigns[:available_mentees]).to include @ruby_mentee
      end

      it 'assigns correct mentors' do
        expect(assigns[:available_mentees]).not_to include @python_mentee
      end
    end

  end
end
