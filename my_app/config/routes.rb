Rails.application.routes.draw do

  root 'sessions#homepage'

  devise_for :dietitians
  get "/diet/all_dietitians", :controller => "dietitians", :action => "all_dietitians"
  post "/diet/update_dietitian/:id", :controller => "dietitians", :action => "update_dietitian"
  get "/diet/edit_dietitian/:id", :controller => "dietitians", :action => "edit_dietitian"
  get "/diet/:id", :controller => "dietitians", :action => "show_dietitian"
  get "/diet/rate/:id/:rate", :controller => "dietitians", :action => "rate_dietitian"
  # BOOK
  get "/diet/to_book/:dietitian/:client", :controller => "dietitians", :action => "to_book"


  devise_for :clients


  # Routes for the Session resource:
  # CREATE

   get "/sessions/homepage", :controller => "sessions", :action => "homepage"
   post "/sessions/new", :controller => "sessions", :action => "new_session"

   get "/session/book/:client/:session", :controller => "sessions", :action => "book"
  # post "/create_session", :controller => "sessions", :action => "create"

  # # READ
  # get "/sessions/:id", :controller => "sessions", :action => "show"

  # # UPDATE
  # get "/sessions/:id/edit", :controller => "sessions", :action => "edit"
  # post "/update_session/:id", :controller => "sessions", :action => "update"

  # DELETE
  get "/delete_session/:id", :controller => "sessions", :action => "destroy"

  get "/my_sessions", :controller => "sessions", :action => "my_sessions"

  #------------------------------

  
  #------------------------------

  
  # Routes for the Dietitian resource:
  # CREATE

  #------------------------------

  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
