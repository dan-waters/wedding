Rails.application.routes.draw do
  resources :items do
    resources :payments
  end

  resources :people

  root 'items#index'
end
