require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:user)
    @product = FactoryGirl.create(:product, name: 'NotHappyShirt')
  end

  #Index
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end #end of index

  #Show
  describe 'GET #show' do
    before do
      get :show, params: {id: @product.id}
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end #end of show

  #Create
  describe 'POST #create' do
    context "a product is created" do
      before do
        @product = FactoryGirl.build(:product, name: "")
      end
      it 'creates an invalid product' do
        expect(@product).not_to be_valid
      end
    end
  end #end of create

  #Edit
  describe 'GET #edit' do
    context 'when a user is not logged in' do
      it "responds with a 302 error code" do
        get :edit, params: { id: @product.id }
        expect(response).to have_http_status(302)
      end
    end
    context 'when an user is logged in' do
      it "responds with a HTTP 200 status code" do
        sign_in @user
        get :edit, params: { id: @product.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end #end of edit

  #New
  describe 'GET #new' do
    context 'when a user not logged in' do
      it 'user gets 302 error' do
        request.env["HTTP_REFERER"] ='/login'
        get :new
        expect(response).to have_http_status(302)
      end
    end
    context 'when a user is logged in' do
      it 'responds successfully with 200 status' do
        sign_in @user
        request.env["HTTP_REFERER"] = '/login'
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end #end of new

  #Update
  describe 'PUT #update' do
    before do
      @product = FactoryGirl.create(:product)
      sign_in @admin
    end
    it 'successfully updates a product' do
      @attr = { id: @product.id, name: "HappyShirt", description: @product.description, image_url: @product.image_url, price: @product.price, color: @product.color}
      put :update, params: { id: @product.id, product: @attr }
      @product.reload
      expect(@product.name).to eq "HappyShirt"
    end
  end #end of update

  #Destroy
  describe 'DELETE #destroy' do
    before do
      @product = FactoryGirl.create(:product)
      sign_in @admin
    end
    it 'successfully deletes a product' do
      expect(delete :destroy, params: {:id => @product} ).to redirect_to(products_url)
    end
  end #end of destroy
end