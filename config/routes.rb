Rails.application.routes.draw do

root 'welcome#welcome'
resources :users
resources :welcome
resources :sessions
resources :attractions, except: [:destroy]
get '/signin', to: 'sessions#new'
delete "/logout", to: "sessions#destroy"
post '/rides/new', to: 'rides#new'
end
