# require 'rails_helper'
#
# describe ContactsController do
#
#   before :each do
#     @user = FactoryGirl.create(:user)
#   end
#   describe 'GET #new' do
#     describe 'not signed in' do
#       it 'should redirect user' do
#         get :new, id: @user.id
#         expect(response.status).to eq 302
#       end
#     end
#   end
#
#   describe 'POST #create' do
#     describe 'not signed in' do
#       it 'should redirect user' do
#         post :create, id: @user.id
#         expect(response.status).to eq 302
#       end
#     end
#   end
# end