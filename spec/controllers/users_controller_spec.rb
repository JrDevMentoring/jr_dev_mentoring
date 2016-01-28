require 'rails_helper'


describe UsersController do
  before :each do
    @user = FactoryGirl.create(:user)
  end
  describe 'GET #show' do
    describe 'not signed in' do
       it 'should redirect user' do
          get :show, id: @user.id
          expect(response.status).to eq 302
       end
    end
    describe 'signed in' do
      before :each do
        sign_in(@user)
        get :show, id: @user.id

      end
      it 'should return a success status' do
        expect(response.status).to eq 200
      end
      it 'should assign user with given id as user' do
        expect(assigns(:user)).to eq @user
      end
    end
  end

end