require 'rails_helper'

describe CommunitiesController do

  describe 'GET#index' do
    describe 'unauthenticated user' do
      it 'gets redirected' do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'for authenticated user' do
      before :each do
        mentors = create_list(:user, 3)
        mentees = create_list(:user, 4)

        mentors.each do |mentor|
          FactoryGirl.create(:profile, :mentor, user: mentor)
        end

        mentees.each do |mentee|
          FactoryGirl.create(:profile, :mentee, user: mentee)
        end

        @available_mentors = User.mentors
        @available_mentees = User.mentees


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

  end
end
