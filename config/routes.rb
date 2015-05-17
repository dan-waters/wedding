Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :items do
    resources :payments
  end
  resources :people
  resources :guests
  resource :honeymoon, except: [:new, :create, :index] do
    resources :destinations do
      resource :hotel, except: [:index]
    end
  end
end
