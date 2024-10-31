Rails.application.routes.draw do
  # Rutas de Devise para autenticación de usuarios
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # Rutas específicas para administradores
  namespace :admin do
    # Ruta para el dashboard del administrador
    get 'dashboard', to: 'dashboard#index'
    
    # Gestión de productos (acciones CRUD para admins)
    resources :products
    # Gestión de usuarios para el administrador
    resources :users
  end

  # Rutas para los clientes
  resources :products, only: [:index, :show]  # Rutas públicas para productos
  resources :orders, only: [:index, :show, :create]  # Historial y creación de pedidos

  # Carrito de compras
  post 'cart/add', to: 'carts#add', as: :cart_add
  delete 'cart/remove', to: 'carts#remove', as: :cart_remove
  get 'cart', to: 'carts#show', as: :cart
  post 'cart/checkout', to: 'carts#checkout', as: :checkout_cart

  # Ruta raíz para la página de inicio, que podría ser la lista de productos
  root "products#index"

  # Rutas para la verificación de la aplicación y PWA
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
