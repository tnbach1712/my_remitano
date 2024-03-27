# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @user = FactoryBot.create(:user)
  end

  it 'logs in and redirects to the root path' do
    post :create, params: { user: { email: @user.email, password: @user.password } }
    expect(response).to redirect_to(root_path)
    expect(controller.current_user).to eq(@user)
  end

  it 'logs out and redirects to the root path' do
    sign_in @user
    delete :destroy
    expect(response).to redirect_to(root_path)
    expect(controller.current_user).to be_nil
  end
end
