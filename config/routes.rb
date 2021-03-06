Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    get '/users/update_email' => 'users/registrations#update_email', :as => "update_email_user_registration"
    post '/users/create_with_email' => 'users/registrations#create_with_email', :as => "create_email_user_registration"
  end
  
  
  root 'static_pages#home'
  get 'about'     =>    'static_pages#about'
  get 'contact'   =>    'static_pages#contact'

  get 'friends'   =>    'friends#index'
  post 'friends/refresh_twitter'   =>    'friends#refresh_twitter'
  get 'friends/new'       =>    'friends#new'
  post 'friends'      =>    'friends#create'
  get 'friends/:id/edit' => 'friends#edit', as: "edit_friend"
  put 'friends/:id' => 'friends#update', as: "save_friend"

  get 'friends/recent' => 'friends#recent_friends', as: "recent_friends"
  


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
