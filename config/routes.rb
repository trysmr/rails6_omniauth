Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/auth/developer/callback', to: 'sessions#create'

  match '/auth/failure', to: 'sessions#failure', via: [:get, :post]

  root to: 'index#index'
end
