require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "responds successfully" do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

end
