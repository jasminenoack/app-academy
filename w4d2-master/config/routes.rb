Rails.application.routes.draw do
  resources :cats do
    resources :cat_rental_requests, only: :index
  end
  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post 'approve'
      post 'deny'
    end
  end


  resource :user, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy, :index] do
    member do
      delete "delete_other"
    end
  end
end
