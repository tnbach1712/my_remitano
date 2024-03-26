FactoryBot.define do
  factory :user do
    email { "john@example.com" }
    password { "password" }

  factory :user_without_email do
    password { "password" }
    password_confirm { "password" }

  factory :user_password_not_match do
    email { "john@example.com" }
    password { "password" }
    password_confirm { "password123" }
  end
end
