require 'rails_helper'

describe ConnectionsController do
  before do
    @request.env['HTTP_REFERER'] = 'http://test.com/sessions/new'
    @profile = FactoryGirl.create(:profile)
  end
  describe 'unauthenticated' do
    it 'should not be able to send a connection request if not signed in' do
      expect{get :new, profile_id: @profile.id }.not_to change{ ActionMailer::Base.deliveries.count }
    end

  end

  describe 'authenticated' do
    it 'should not be able to send a connection request if user has no profile' do
      user = FactoryGirl.create(:user)
      sign_in user
      expect{ get :new, profile_id: @profile.id }.not_to change{ ActionMailer::Base.deliveries.count }
      expect(response).to redirect_to 'http://test.com/sessions/new'
    end

    it 'should be able to send a connection request if user has a profile' do
      user = FactoryGirl.create(:user)
      user.profile = @profile
      user.save
      sign_in user
      expect{ get :new, profile_id: @profile.id }.to change{ ActionMailer::Base.deliveries.count }.by(2)
    end

  end

end
