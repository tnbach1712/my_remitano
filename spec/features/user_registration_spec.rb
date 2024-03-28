# frozen_string_literal: true

# spec/features/user_registration_spec.rb
require 'rails_helper'

RSpec.feature 'UserRegistrations', type: :feature do
  scenario 'User signs up' do
    visit new_user_registration_path

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password1234'
    fill_in 'Password confirmation', with: 'password1234'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'User logs in' do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'User logs out' do
    user = FactoryBot.create(:user)
    # Simulate user login
    login_as(user, scope: :user)

    visit root_path

    within('header') do
      first("a[href='#{destroy_user_session_path}']").click
    end

    expect(page).to have_content('Signed out successfully.')
  end
end
