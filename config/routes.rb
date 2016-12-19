Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get '/login',    to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  post '/sessions/create', to: 'sessions#create', as: 'session'

  get '/register', to: 'users#new', as: 'new_user'

  resources :users, except: [:new]
  resources :posts
  resources :comments, except: [:index, :edit, :update]
  resources :follows, except: [:index, :edit, :update]
end
