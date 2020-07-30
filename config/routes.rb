Rails.application.routes.draw do
  get "search", to: "pedidos#search"
  get "pedmanual", to: "pedidos#pedmanual"
  resources :estados
  resources :bahias
  resources :pasillos
  devise_for :users
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
  resources :items_imports, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end