require 'rails_helper'

RSpec.describe Post, type: :model do
  
  it "group、request、give、content、img、movieがある場合、有効である" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      album: "sticker",
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
      album: "sticker",
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

  it "albumがない場合無効" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      album: nil,
      request: "request",
      give: "give",
      content: "content",
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
  post.valid?
    expect(post.errors[:album]).to include("can't be blank")
  end

  it "requestがない場合無効" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      album: "sticker",
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
      album: "sticker",
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
      album: "sticker",
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
      album: "sticker",
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
      album: "sticker",
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
      album: "sticker",
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
      album: "sticker",
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
      album: "sticker",
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

  
  it "グループ名がひらがなの場合投稿できない" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "ぐるーぷ",
      album: "sticker",
      request: "request",
      give: "give",
      content: "content",
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_invalid
  end

  it "グループ名がカタカナの場合投稿できない" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "グループ",
      album: "sticker",
      request: "request",
      give: "give",
      content: "content",
      img: "img.jpg",
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_invalid
  end

  it "グループ名が英語の場合投稿できる" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      album: "sticker",
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

  it "グループ名が全角数字の場合投稿できる" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "１２７",
      album: "sticker",
      album: "sticker",
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

  it "グループ名が半角数字の場合投稿できる" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "127",
      album: "sticker",
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

  it "グループ名が英数字の場合投稿できる" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "NCT127",
      album: "sticker",
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

  it "imgが51文字以上の場合は登録できない" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      album: "sticker",
      request: "request",
      give: "give",
      content: "content",
      img: "a"*51,
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_invalid
  end

  it "imgが50文字以上の場合" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      album: "sticker",
      request: "request",
      give: "give",
      content: "content",
      img: "a"*50,
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_valid
  end

  it "imgが50文字以上の場合" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      album: "sticker",
      request: "request",
      give: "give",
      content: "content",
      img: "a"*49,
      movie: "movie.mp4",
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_valid
  end

  it "movieが51文字以上の場合は登録できない" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      album: "sticker",
      request: "request",
      give: "give",
      content: "content",
      img: "img",
      movie: "a"*51,
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_invalid
  end

  it "movieが50文字以上の場合" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      album: "sticker",
      request: "request",
      give: "give",
      content: "content",
      img: "img",
      movie: "a"*50,
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_valid
  end

  it "movieが49文字以上の場合" do
    post = Post.new(
      id: "1",
      user_id: "1",
      group: "group",
      album: "sticker",
      request: "request",
      give: "give",
      content: "content",
      img: "img",
      movie: "a"*49,
      created_at: "created",
      updated_at: "update"
    )
    expect(post).to be_valid
  end

  
end

