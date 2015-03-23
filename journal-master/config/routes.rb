Rails.application.routes.draw do
  namespace 'api' do
    resources :posts
  end
  resource :roots, only: :show
  root 'roots#show'
end
