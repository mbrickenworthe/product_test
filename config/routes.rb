Rails.application.routes.draw do
  root 'welcome#index'

  get 'mad_money' => 'welcome#index'
  get 'this_is_the_sign_up_route' => 'users#new', :as => 'mr_signy'
  get 'this_is_the_log_in_route' => 'sessions#new', :as => 'mr_logy'

  put 'upvote/:id' => 'posts#upvote', :as => "upvote"
  put 'downvote/:id' => 'posts#downvote', :as => "downvote"
  patch 'add_comment' => 'posts#add_a_comment', :as => 'add_comment'

  delete 'this_is_the_sign_out_route' => 'sessions#destroy', :as => 'sign_out'

  resources :sessions
  resources :posts do
    resources :comments
  end
  resources :products 
  resources :users

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
