Rails.application.routes.draw do

  #users routes
  devise_for :users
  resources :users, only: [:update, :show, :new, :index]

  resources :users do
  	resources :items, only: [:create, :new, :destroy]
  end
  
  #if the user is logged in the root will be to this 
  authenticated :user do
  	root to: "users#show", as: :authenticated_root, via: :get
  end

  #otherwise the root will be this
  unauthenticated do
  	root 'welcome#index'
  end

end
