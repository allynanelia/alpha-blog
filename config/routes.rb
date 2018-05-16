Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles #gave a lot of paths for CRUD for the table in db, can check with rails routes

  get 'signup', to: 'users#new' #users controller, 'new' action
  resources :users, except: [:new] #want all the routes except new user route, because already got signup

  resources :categories, exception: [:destroy] # do not allow destroy for categories
end
