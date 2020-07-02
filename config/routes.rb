Rails.application.routes.draw do
  
  resources :pedidos do
      collection { post :import }
      resources :entregas
  end
  resources :responsables
  resources :tipo_entregas
  resources :ubicaciones
  resources :roles
  resources :productos
  root 'clubes#index'
  resources :clubes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
