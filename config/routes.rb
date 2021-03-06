Rails.application.routes.draw do
  root to: 'projects#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: :create
  resources :projects
  
  resources :tickets do
    resources :comments, except: [:index, :new, :show, :destroy]
  end
  
  resources :tags, except: :show
end
