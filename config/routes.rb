Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  # get '/', to: 'pages#home'
  resources :users

  resources :posts

  resources :comments, except: [:index, :edit, :update]

  resources :follows, except: [:index, :edit, :update]



end
