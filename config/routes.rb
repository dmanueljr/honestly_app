Rails.application.routes.draw do


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root "honest#index"
  get "/public" => "honest#public"

  #users routes
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/new" => "users#new"
  get "/users/:id/edit" => "users#edit", as: :edit_user
  get "/users/:id" => "users#show", as: :user
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"


  #messages routes
  get "/messages" => "messages#index"
  post "/messages" => "messages#create"
  get "/messages/new" => "messages#new"
  get "/messages/:id/edit" => "messages#edit", as: :edit_message
  get "/messages/:id" => "messages#show", as: :message
  patch "/messages/:id" => "messages#update"
  delete "/messages/:id" => "messages#destroy"


  #addresses routes
  get "/messages/:message_id/addresses" => "addresses#index", as: :message_addresses
  post "/messages/:message_id/addresses" => "addresses#create"
  get "/messages/:message_id/addresses/new" => "addresses#new", as: :new_message_address
  get "/messages/:message_id/addresses/:id/edit" => "addresses#edit", as: :edit_address
  get "/messages/:message_id/addresses/:id" => "addresses#show", as: :message_address
  patch "/messages/:message_id/addresses/:id" => "addresses#update"
  delete "/messages/:message_id/addresses/:id" => "addresses#destroy"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  

  get '/login' => 'sessions#new', as: :sign_up
  post '/login' => 'sessions#create', as: :sign_in
  delete '/logout' => 'sessions#destroy', as: :sign_out


  #omniauth
  # get "/auth/:provider/callback" => "sessions#create"
  # get 'auth/logout' => 'sessions#destroy'
  # get 'sessions/show'



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
