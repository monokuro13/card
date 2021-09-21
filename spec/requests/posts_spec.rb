require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "responds successfully" do
      get '/posts/index'
      expect(response).to be_successful
    end

    it "returns a 200 response" do
      get "/posts/index"
      expect(response).to have_http_status "200"
    end
  end



  describe "GET /new" do 
    before do 
      @user = FactoryBot.create(:user)
    end

    it "レスポンスを返すか" do
      get '/posts/new'
      expect(response).to be_successful
    end

    it "200を返すか" do
      get '/posts/new'
      expect(response).to have_http_status "200"
    end
  end

  end

  
end
