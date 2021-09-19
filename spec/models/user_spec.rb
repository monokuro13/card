require 'rails_helper'

RSpec.describe User, type: :model do
  it "姓、名、メール、パスワードがある場合、有効である" do
    user = User.new(
      name: "user1",
      email: "user1@user.com",
      password: "user1pass",
    )
    expect(user).to be_valid
  end

  it "nameがない場合無効" do
    user = User.new(
      name: nil,
      email: "user1@user.com",
      password: "user1pass",
    )
  user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "emailがない場合無効" do
    user = User.new(
      name: "name",
      email: nil,
      password: "user1pass",
    )
  user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "passwordがない場合無効" do
    user = User.new(
      name: "name",
      email: "user@gmail.com",
      password: nil,
    )
  user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "重複したメールアドレスの場合、無効である" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end
  
end
