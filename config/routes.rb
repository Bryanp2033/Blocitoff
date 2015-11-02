Rails.application.routes.draw do
  

  devise_for :users
  resources :users, only: [:update, :show, :new, :index]

  resources :users do
    resources :items, only: [:create, :new, :destroy]
  end
  

   authenticated :user do
 root to: "users#show", as: :authenticated_root, via: :get
end


unauthenticated do
  root 'welcome#index'
end

end
