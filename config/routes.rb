Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/nfl_athletes/:name', to: 'nfl_athletes#show' 
  resources :nfl_athletes, only: [:index]
  resources :users, :investments
end
