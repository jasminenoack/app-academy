Rails.application.routes.draw do
  root to: 'subs#index'

  resources :subs, except: :destroy do
    resources :posts, only: [:new]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  resources :posts, except: [:index, :destroy, :new] do
    resources :comments, only: [:new]
  end

  resources :comments, only: [:create, :show]


end
