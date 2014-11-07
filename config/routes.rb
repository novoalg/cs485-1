Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  resources :item_categories

  resources :items
  match '/toggle_activeness/:id', to: 'items#toggle_activeness', via: 'get'

  get 'static_pages/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  resources :users
  put '/set_role/:id', to: 'users#set_role', as: 'set_role'
  resources :email_templates, :only => [:index, :edit, :update]
  get '/mass_email', to: 'email_templates#new_mass_email', as: 'new_mass_email'
  put '/mass_email', to: 'email_templates#mass_email', as: 'mass_email'
  match '/about',     to: 'static_pages#about', via: 'get'
  match '/contact',   to: 'static_pages#contact', via: 'get'
  match '/inventory', to: 'inventory#index', via: 'get'
  root 'static_pages#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
