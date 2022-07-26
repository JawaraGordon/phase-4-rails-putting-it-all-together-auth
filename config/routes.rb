Rails.application.routes.draw do
  resources :recipes, only: [:index, :create]
  post '/signup', to: 'users#create'
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"
  get '/me', to: 'users#show'
end
