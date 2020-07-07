Rails.application.routes.draw do
  devise_for :users
  resources :pedidos do
      collection { post :import }
      resources :entregas
  end
  resources :responsables
  resources :tipo_entregas
  resources :ubicaciones
  resources :roles
  resources :productos
  root 'home#index'
  resources :clubes
  resources :items_imports, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# Some setup you must do manually if you haven't yet:

#   Ensure you have overridden routes for generated controllers in your routes.rb.
#   For example:

#     Rails.application.routes.draw do

#       devise_for :users, controllers: {
#         sessions: 'users/sessions'
#       }
#     end