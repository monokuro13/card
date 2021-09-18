require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a email,password and name" do
    user = User.new(
      name: "user1",
      email: "user1@user.com",
      password: "user1pass",
    )
    expect(user).to be_valid
  end
end
