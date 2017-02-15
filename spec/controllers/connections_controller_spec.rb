require 'rails_helper'

describe ConnectionsController do

  let(:profile) { create(:profile) }
  let(:connection_request) { get :new, profile_id: profile.id }

  before do
    @request.env['HTTP_REFERER'] = 'http://test.com/sessions/new'
  end

  describe 'unauthenticated' do
    it 'should not be able to send a connection request if not signed in' do
      expect{ connection_request }.not_to change{ ActionMailer::Base.deliveries.count }
    end
  end

  describe 'authenticated' do
    it 'should not be able to send a connection request if user has no profile' do
      user = create(:user)
      sign_in user
      expect{ connection_request }.not_to change{ ActionMailer::Base.deliveries.count }
      expect(response).to redirect_to 'http://test.com/sessions/new'
    end

    context 'with completed params' do
      before do
        @user = create(:profile).user
        sign_in @user
      end

      it 'should be able to send a connection request if user has a profile' do
        profile = @user.profile
        expect{ connection_request }.to change{ ActionMailer::Base.deliveries.count }.by 2
      end

      it 'should create a new connection' do
        profile = @user.profile
        expect{ connection_request }.to change{ Connection.count }.by 1
      end
    end

  end

end
