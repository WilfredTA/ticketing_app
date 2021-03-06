Rails.application.routes.draw do
  root to: "projects#index"
  resources :projects
  resources :tickets
  resources :tags, except: :show

  resources :users, only: [:edit, :create, :update]
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :comments, only: [:create, :edit, :update]
end
