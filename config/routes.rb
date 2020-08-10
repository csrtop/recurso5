Rails.application.routes.draw do
  
  get "search", to: "pedidos#search"
  get "pedmanual", to: "pedidos#pedmanual"
  get "mispedidos", to: "pedidos#mispedidos"
  get "pedidoscerrados", to: "pedidos#pedidoscerrados"
  resources :estados
  resources :items_imports, only: [:new, :create]
  resources :bahias
  resources :pasillos
  #devise_for :users #add31_07
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :pedidos do
      collection { post :import }
      resources :entregas
      resources :responsables
      resources :posiciones
      resources :estadospedidos
  end
  resources :tipo_entregas
  resources :roles
  resources :productos
  root 'pedidos#index'
  resources :clubes do
    resources :ubicaciones
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end