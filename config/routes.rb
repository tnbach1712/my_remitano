# frozen_string_literal: true

Rails.application.routes.draw do
  resources :share_videos
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'share_videos#index'
end
