require 'rails_helper'

describe UsersController, type: :controller do

  before do
    @user1 = User.create!(first_name: "Catherine", last_name: "Alanna", email: "hello@catherinealanna.com", password: "123456")
    @user2 = User.create!(first_name: "Alanna", last_name: "Charnock", email: "alanna.charnock@gmail.com", password: "124567")
  end

  describe 'GET #show' do

    context 'when a user is logged in' do
      before do
        sign_in @user1
      end

      it 'loads correct user details' do
        get :show, params: { id: @user1.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user1
      end

      it 'cant access other users show page' do
        get :show, params: { id: @user2.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user1.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end