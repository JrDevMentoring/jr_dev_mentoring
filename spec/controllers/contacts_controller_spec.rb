require 'rails_helper'

describe ContactsController do

  describe 'unauthenticated user' do
    it "should give a success response for the new action" do
      get :new
      expect(response.status).to eq 200
    end
    it 'should give a success response for the create action' do
      contact = FactoryGirl.attributes_for(:contact)
      expect{post :create, contact: contact}.to change{ ActionMailer::Base.deliveries.count }.by(1)
      expect(response.status).to eq 302
    end
  end

  describe 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
    it "should give a success response for the new action" do
      get :new
      expect(response.status).to eq 200
    end
    it 'should give a success response for the create action' do
      contact = FactoryGirl.attributes_for(:contact)
      expect{post :create, contact: contact}.to change{ ActionMailer::Base.deliveries.count }.by(1)
      expect(response.status).to eq 302
    end
  end
end