Rails.application.routes.draw do
  resources :share_videos
  devise_for :users

  root "share_videos#index"
end
