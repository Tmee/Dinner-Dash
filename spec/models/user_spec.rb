require 'rails_helper'

RSpec.describe User, :type => :model do
    let(:user) do
      User.new(first_name: "Jim",
               last_name: "Jones",
               email: "jimmy@jones.com",
               username: "Jim",
               password: "password",
               password_confirmation: "password"
               )
    end

  it "is valid" do
    expect(user).to be_valid
  end

  it 'is invalid without a full name' do
    user.first_name = nil
    expect(user).not_to be_valid

    user.last_name = ""
    expect(user).not_to be_valid
  end

  it 'can have a username more than 2 characters and less than 32' do
    user.username = "j"
    expect(user).not_to be_valid

    user.username = "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
    expect(user).not_to be_valid
  end

  it 'cannot create a user with the same email' do
    user1 = User.create(first_name: "Jim",
             last_name: "Jones",
             email: "test@jones.com",
             username: "Jim",
             password: "password",
             password_confirmation: "password"
             )
    user2 = User.create(first_name: "Jim",
             last_name: "Jones",
             email: "test@jones.com",
             username: "Jim",
             password: "password",
             password_confirmation: "password"
             )

    expect(user2).not_to be_valid
  end
end
