require 'rails_helper'
# require 'spec_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @request.env['warden'] = warden
     @user = FactoryBot.create(:user)
     @post = FactoryBot.create(:post, user_id: @user.id)
      sign_in @user
  end

  describe 'GET index' do
      it 'assigns post' do
         get :index
          expect(response).to have_http_status(302)
      end
    end

  describe 'GET new' do
    it 'initialize post' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'Post create' do
    it 'create Post' do
      post :create, params: { post: @post}
      # @post = FactoryBot.create :post, user: @user
      # debugger
    end
  end

   describe 'GET show' do
    it 'show post' do
      get :show, params: { id: @post.id}
      expect(response).to be_successful
    end
  end

   describe 'GET Edit' do
    it 'Edit the post' do
      get :edit, params: { id: @post.id}
      expect(response).to be_successful
    end
  end

  describe "PUT 'update/:id'" do
  it "allows an post to be updated" do
    put :update, params: { id: @post.id, content: 'test5432',user_id: @user.id }
    @post.reload
    expect(response).to have_http_status(302)
  end
end

describe 'DELETE destroy' do
    it 'delete the post' do
      expect { delete :destroy, params: { id: @post } }.to change { Post.count }.by(-1)
    end
  end

end 
