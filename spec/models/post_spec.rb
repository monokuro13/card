require 'rails_helper'

RSpec.describe Post, type: :model do
  
  it "group、request、give、content、img、movieがある場合、有効である" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      request: "request",
      give: "give",
      content: "content",
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_valid
  end

  it "groupがない場合無効" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: nil,
      request: "request",
      give: "give",
      content: "content",
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
  post.valid?
    expect(post.errors[:group]).to include("can't be blank")
  end

  it "requestがない場合無効" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      request: nil,
      give: "give",
      content: "content",
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
  post.valid?
    expect(post.errors[:request]).to include("can't be blank")
  end

  it "giveがない場合無効" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      request: "request",
      give: nil,
      content: "content",
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
  post.valid?
    expect(post.errors[:give]).to include("can't be blank")
  end

  it "contentがない場合無効" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      request: "request",
      give: "give",
      content: nil,
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
  post.valid?
    expect(post.errors[:content]).to include("can't be blank")
  end

  it "imgがない場合無効" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      request: "request",
      give: "give",
      content: "content",
      img: nil,
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
  post.valid?
    expect(post.errors[:img]).to include("can't be blank")
  end

  it "movieがない場合無効" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      request: "request",
      give: "give",
      content: "content",
      img: "img.jpg",
      movie: nil,
      created_at: "created",
      updated_at: "update"
    )
  post.valid?
    expect(post.errors[:movie]).to include("can't be blank")
  end

  it "contentが141文字以上の場合は登録できない" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      request: "request",
      give: "give",
      content: "a"*141,
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_invalid
  end

  it "contentが140文字以上の場合" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      request: "request",
      give: "give",
      content: "a"*140,
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_valid
  end

  it "contentが139文字以上の場合" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      request: "request",
      give: "give",
      content: "a"*139,
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_valid
  end

  
end
