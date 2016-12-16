Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get '/login',    to: 'users#login', as: 'login'
  get '/register', to: 'users#new', as: 'new_user'

  post '/sessions/create', to: 'sessions#create', as: 'session'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, except: [:new]
  resources :posts
  resources :comments, except: [:index, :edit, :update]
  resources :follows, except: [:index, :edit, :update]
end
