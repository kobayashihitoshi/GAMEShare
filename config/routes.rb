Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  
  resources :users, only: [:show, :edit, :update, :destroy]
  get '/users/:user_id/mypage', to: 'users#mypage', as: 'user_mypage', constraints: { user_id: /\d+/ }
  get '/mypage', to: 'users#mypage'
  
  resources :posts, only: [:show, :edit, :create, :update, :destroy]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
