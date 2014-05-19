Homeflix::Application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/sessions' => 'sessions#show'
  get '/sessions' => 'sessions#index'

  root to: 'main#index'
  get'/login' => "main#login"
  
  # User routes
  get '/users' => 'users#index'

  # Movie routes 
  get '/movies' => 'movies#index'
  get '/movies/last' => 'movies#last'
  get '/movies/:key' => 'movies#search'
  get '/genres' => 'movies#genres'

  # Favorit routes
  get 'favorits/:user_id' => 'favorits#index'
  get 'favorits/:user_id/:imdb_id' => 'favorits#show'
  delete 'favorits/:user_id/:imdb_id' => 'favorits#destroy'
  post 'favorits/:user_id/:imdb_id' => 'favorits#create'

  # Comment routes
  get 'comment/:imdb_id' => 'comments#index'
  delete 'comment/:imdb_id/:user_id/:comment_id' => 'comments#destroy'
  post 'comment/:imdb_id/:user_id' => 'comments#create'

  # Rating routes
  get 'ratings/:imdb_id' => 'ratings#index'
  get 'ratings/:imdb_id/:user_id' => 'ratings#show'
  put 'ratings/:imdb_id/:user_id' => 'ratings#update'
  post 'ratings/:imdb_id/:user_id' => 'ratings#create'

  # Progress routes
  get 'progresses/:imdb_id/:user_id' => 'progress#show'
  post 'progresses/:imdb_id/:user_id' => 'progress#create'
  put 'progresses/:imdb_id/:user_id' => 'progress#update'
  delete 'progresses/:imdb_id/:user_id' => 'progress#destroy'

  # IMDB routes 
  get '/imdb' => 'imdb#index'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:


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
