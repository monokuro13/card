require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "レスポンスが返ってくるか" do
      get '/users/index'
      expect(response).to be_successful
    end

    it "200が返ってくるか" do
      get '/users/index'
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /signup" do
    it "レスポンスを返すか" do
      get '/signup'
      expect(response).to be_successful
    end
  end


  describe 'GET /show' do
    before do
      @user = FactoryBot.create(:user)
      post "/login", params: { session: { email: @user.email, password: @user.password } }
      
    end
  
    it 'return a 200 response' do
                          
      expect(response).to have_http_status(200)
    end
  
    
    
  end

end
