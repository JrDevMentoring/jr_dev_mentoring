require 'rails_helper'

describe Users::RegistrationsController do

  describe 'POST #create' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]

    end
    it 'should redirect user' do
      post :create
      expect(response.status).to eq 200
    end
  end
end