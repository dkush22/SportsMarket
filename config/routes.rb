Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/nfl_athletes/:name', to: 'nfl_athletes#show' 
  get '/users/me', to: 'users#me'
  post '/users', to: 'users#create'
  post '/login', to: 'auth#create'
  post '/signup', to: 'users#new'
  post '/newinvestment', to: 'investments#create'
  delete '/deleteinvestment', to: 'investments#destroy'
  get '/welcome', to: 'application#welcome'
  patch '/investments', to: 'investments#update'
  resources :nfl_athletes, only: [:index]
  resources :users, :investments
end
