Rails.application.routes.draw do
  get 'home/index'

  resources :items do
    resources :payments
  end

  resources :people

  root 'home#index'
end
