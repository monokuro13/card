require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'GET /about' do
    it "レスポンスが返ってくるか" do
      get '/about'
      expect(response).to be_successful
    end

    it "200が返ってくるか" do
      get '/about'
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /index" do
    let(:user) { FactoryBot.create(:user) }
    context 'ユーザーがログインしている場合' do
      before do
        sign_in(user)
        get "/users/index"
      end
      it 'responds successfully' do
        expect(response).to be_successful
      end

      it 'returns a 200 response' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /signup" do
    
    it "レスポンスを返すか" do
      get '/signup'
      expect(response).to be_successful
    end

    it 'return a 200 response' do
      get "/signup"                     
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /login' do
    it "レスポンスを返すか" do
      get '/login'
      expect(response).to be_successful
    end

    it 'return a 200 response' do
      get "/login"                     
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new" do 
    let(:user) { FactoryBot.create(:user) }
    context 'ユーザーがログインしている場合' do
      before do
        sign_in(user)
        get "/posts/new"
      end
      it 'responds successfully' do
        expect(response).to be_successful
      end

      it 'returns a 200 response' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /show' do
    
      let(:user) { FactoryBot.create(:user) }
      context 'ユーザーがログインしている場合' do
        before do
          sign_in(user)
          get "/users/1"
        end
        it 'responds successfully' do
          expect(response).to be_successful
        end

        it 'returns a 200 response' do
          expect(response).to have_http_status(200)
        end
      end
  end

  describe 'GET /edit' do
    
    let(:user) { FactoryBot.create(:user) }
    context 'ユーザーがログインしている場合' do
      before do
        sign_in(user)
        get "/users/1/edit"
      end
      it 'responds successfully' do
        expect(response).to be_successful
      end

      it 'returns a 200 response' do
        expect(response).to have_http_status(200)
      end
    end
end
  

end
