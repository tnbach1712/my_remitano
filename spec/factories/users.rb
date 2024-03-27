# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'john@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :user_password_not_match, parent: :user do
    password_confirmation { 'password@' }
  end

  factory :user_email_blank, parent: :user do
    email { '' }
  end
end
