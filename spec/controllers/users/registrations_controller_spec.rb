# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  it 'creates a user and redirects to the root path' do
    post :create,
         params: { user: { email: 'test@example.com', password: 'password1234',
                           password_confirmation: 'password1234' } }
    expect(response).to redirect_to(root_path)
    expect(User.last.email).to eq('test@example.com')
  end
end
