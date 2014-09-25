Rails.application.routes.draw do

  resources :tracks do
    resources :comments
  end

  root to: "users#index"

  # get "/", to: "application#index"

  get 'passwords/new'

  get 'passwords/create'

  get 'passwords/edit'

  get 'passwords/update'

  resources :users, except: [:new, :edit]

  # match "*path", to: "users#index", via: "get"


  get "/login",     to: "session#new"

  post "/login",    to: "session#create"

  delete "/logout", to: "session#destroy"

  get "/logout",    to: "session#destroy" #TO DO: delete this before production

  get "/signup",    to: "users#new"

  post '/signup', to: "users#create"

  get '/about', to: "users#about", as: "about"


end