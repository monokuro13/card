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



  
  describe 'GET /show' do
    
    let(:user) { FactoryBot.create(:user) }
    context 'ユーザーがログインしている場合' do
      before do
        sign_in(user)
        post= user.posts.create(
          id: "1",
          group: "group",
          album: "album",
          request: "request",
          give: "give",
          content: "content",
          img: "img.jpg",
          movie: "movie.mp4",
          created_at: "created",
          updated_at: "update"
        )
        get "/posts/1"
      end
      it 'responds successfully' do
        expect(response).to be_successful
      end

      it 'returns a 200 response' do
        expect(response).to have_http_status(200)
      end
    end
  end
    describe 'GET edit' do
      let(:user) { FactoryBot.create(:user) }
      context 'ユーザーがログインしている場合' do
        before do
          sign_in(user)
          post= user.posts.create(
            id: "1",
            group: "group",
            album: "album",
            request: "request",
            give: "give",
            content: "content",
            img: "img.jpg",
            movie: "movie.mp4",
            created_at: "created",
            updated_at: "update"
          )
          get "/posts/1/edit"
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
