Rails.application.routes.draw do

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

  resources :galleries
  resource :headline, only: [:edit, :update]
end
