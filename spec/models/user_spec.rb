# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without an email' do
    user = build(:user_email_blank)
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = build(:user, password: nil, password_confirmation: nil)
    expect(user).to_not be_valid
  end

  it 'is not match password' do
    user = build(:user_password_not_match)
    expect(user).to_not be_valid
  end

  it 'password too short' do
    user = build(:user, password: '123', password_confirmation: '123')
    expect(user).to_not be_valid
  end

  it 'is valid with an email and password' do
    user = build(:user)
    expect(user).to be_valid
  end
end
