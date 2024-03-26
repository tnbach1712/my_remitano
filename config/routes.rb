Rails.application.routes.draw do
  resources :share_videos
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root "share_videos#index"
end
