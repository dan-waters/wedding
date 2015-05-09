Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :items do
    resources :payments
  end
  resources :people
  resources :guests
end
