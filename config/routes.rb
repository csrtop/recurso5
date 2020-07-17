Rails.application.routes.draw do


  resources :estados
  resources :bahias
  resources :pasillos
  devise_for :users
  resources :pedidos do
      collection { post :import }
      resources :entregas
      resources :posiciones
  end
  resources :responsables
  resources :tipo_entregas
  resources :roles
  resources :productos
  root 'home#index'
  resources :clubes do
    resources :ubicaciones  do
    end
  end
  resources :items_imports, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end