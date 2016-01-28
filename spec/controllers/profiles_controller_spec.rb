require 'rails_helper'

describe ProfilesController do

  before :each do
    @user = FactoryGirl.create(:user)
    @profile_attr = FactoryGirl.attributes_for(:profile)
  end
  describe "user not signed in" do
    it 'should redirect user' do
      [:new, :edit].each do |action|
        get action, :user_id => @user.id
        expect(response.status).to eq 302
      end
    end
  end
  describe 'GET #new' do
    before do
      sign_in @user
      get :new, :user_id => @user.id
    end
    it 'should assign a new instance of Profile as profile' do
      expect(assigns(:profile)).to be_a_new(Profile)
    end
    it 'should assign a user with given id as user' do
      expect(assigns(:user)).to eq @user
    end
  end

  describe 'POST #create' do
    describe 'not signed in' do
      it 'should redirect user' do
        post :create, :user_id => @user.id, profile: @profile_attr
        expect(response.status).to eq 302
      end
    end
  end

  describe 'GET #edit' do
    before do
      sign_in @user
      get :edit, :user_id => @user.id
    end
    it 'should assign a new instance of Profile as profile' do
      expect(assigns(:profile)).to be @user.profile
    end
    it 'should assign a user with given id as user' do
      expect(assigns(:user)).to eq @user
    end
  end

  describe 'PUT #update' do
    before do
      @profile = FactoryGirl.create(:profile, user: @user)
      @new_profile = FactoryGirl.attributes_for(:profile)
    end
    describe 'not signed in' do
      it 'should redirect user' do
        put :update, :user_id => @user.id, profile: @new_profile
        expect(response.status).to eq 302
      end
    end
    describe 'signed in' do
      it 'should redirect to user path' do
        sign_in @user
        put :update, :user_id => @user.id, profile: @new_profile
        expect(response.status).to eq 302
        expect(response).to redirect_to(user_path(@user.id))
      end
    end

  end
end