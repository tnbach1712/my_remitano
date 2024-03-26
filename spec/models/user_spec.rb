require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without an email' do
    user = User.new(password: 'password123', password_confirmation: 'password123')
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(email: 'test@example.com')
    expect(user).to_not be_valid
  end

  it 'is valid with an email and password' do
    user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    expect(user).to be_valid
  end
end
