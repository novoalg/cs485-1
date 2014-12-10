Rails.application.routes.draw do

  get 'orders/index'

  get 'orders/user'

  get 'carts/index'

  root 'static_pages#index'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :item_categories
  resources :items
  match '/toggle_activeness/:id', to: 'items#toggle_activeness', via: 'get'

  get 'static_pages/index'

  resources :users
  put '/set_role/:id', to: 'users#set_role', as: 'set_role'
  match '/users/unsubscribe/:signature' => 'users#unsubscribe', as: 'unsubscribe', via: 'get'

  resources :email_templates, :only => [:index, :edit, :update]
  get '/mass_email', to: 'email_templates#new_mass_email', as: 'new_mass_email'
  put '/mass_email', to: 'email_templates#mass_email', as: 'mass_email'
  
  match '/about',     to: 'static_pages#about', via: 'get'
  match '/contact',   to: 'static_pages#contact', via: 'get'
  match '/contact_us',  to: 'static_pages#contact_us', via: 'post'
  match '/inventory', to: 'inventory#index', via: 'get'
  match '/shop', to: 'inventory#shop', via: 'get'
  match '/shop', to: 'inventory#change_category', via: 'post'

  resources :galleries
  resources :static_texts, only: [:edit, :update]
  resource :headline, only: [:edit, :update]
  resources :slider_images, only: [:index, :new, :create, :edit, :update, :destroy]

  resource :cart
  match '/add_to_cart', to: 'carts#add_item', via: 'post'
  match '/remove_from_cart/:id', to: 'carts#destroy', via: 'delete'
  match '/update_cart', to: 'carts#update_cart', via: 'post'
  match '/checkout', to: 'carts#checkout', via: 'get'
  match '/process_cart', to: 'carts#process_cart', via: 'post'

  resources :orders, only: [:index, :show, :destroy]
  match '/my_orders', to: 'orders#user', via: 'get'
  match '/mark_completed', to: 'orders#mark_completed', via: 'post'
  
end
