require 'rails_helper'

describe PagesController do

  before :each do
    @user = create(:user)
  end

  describe 'not signed in' do
    it 'should be a success' do
      [:home, :about].each do |action|
        get action
        expect(response.status).to eq 200
      end
    end
  end
  describe 'signed in' do
    it 'should be a success' do
      sign_in @user
      [:home, :about].each do |action|
        get action
        expect(response.status).to eq 200
      end
    end
  end

  describe 'GET#dashboard' do
    it 'should redirect back when not authenticated' do
      get :dashboard
      expect(response.status).to eq 302
    end

    it 'should be successfull for an authenticated user' do
      sign_in @user
      get :dashboard
      expect(response.status).to eq 200
    end
  end
end