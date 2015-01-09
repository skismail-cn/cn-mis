Rails.application.routes.draw do
  resources :leavetypes

  resources :admins do
    get "lostpassword" => "admins#lostpassword", on: :collection
    post "lostpassword" => "admins#forgotpassword", on: :collection
    get "changepassword" => "admins#changepassword", on: :collection
    post "changepassword" => "admins#updatepassword", on: :collection
  end
    
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"

  resources :sessions

  resources :designations do
    get "search" => "designations#search", on: :collection
    post "search" => "designations#search_results", on: :collection
  end
  
  resources :departments do
    get "search" => "departments#search", on: :collection
    post "search" => "departments#search_results", on: :collection
    #post "autocompleteajax" => "departments#autocompleteajax", on: :collection
  end

  resources :locations do
    post "search" => "locations#search", on: :collection
  end

  resources :availabilities do
    post "search" => "availabilities#search", on: :collection
  end

  resources :skills do
    post "search" =>"skills#search", on: :collection
  end

  resources :members do
    post "search" =>"members#search", on: :collection
    get "fetchdesignation" =>"members#fetchdesignation", on: :collection
  end

  resources :leavetypes do
    post "search" =>"leavetypes#search", on: :collection
  end

  resources :leavedaytypes do
    post "search" =>"leavedaytypes#search", on: :collection
  end

  resources :leavestatuses do
    post "search" =>"leavestatuses#search", on: :collection
  end

  resources :leaves do
    post "search" =>"leaves#search", on: :collection
    post "fetchsuperior" =>"leaves#fetchsuperior", on: :collection
  end

  resources :projectstatuses do
    post "search" =>"projectstatuses#search", on: :collection
  end
  
  resources :projecttypes do
    post "search" =>"projecttypes#search", on: :collection
  end

  resources :projectmodes do
    post "search" =>"projectmodes#search", on: :collection
  end

  resources :projects do
    post "search" =>"projects#search", on: :collection
    resources :payments
  end

  resources :portfolios do
    post "search" =>"portfolios#search", on: :collection
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'admins#index'
   

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
