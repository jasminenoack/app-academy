Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, except: [:edit, :update, :destroy] do
    resources :comments, only: :create
  end

  resources :goals, except: :index do
    resources :comments, only: :create
  end


end
