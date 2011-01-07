ITJobs::Application.routes.draw do
  # See how all your routes lay out with "rake routes"

  namespace "authentication" do
    get "linkedin(/*url)" => "linkedin#index" 
    get "linkedin_callback" => "linkedin#callback"

    get "facebook(/*url)" => "facebook#index" 
    get "facebook_callback" => "facebook#callback"

    get "twitter(/*url)" => "twitter#index" 
    get "twitter_callback" => "twitter#callback"

    get "google(/*url)" => "google#index" 
    get "google_callback" => "google#callback"

    get "openid(/*url)" => "openid#index" 
    get "openid_callback" => "openid#callback"

    get "itjobs(/*url)" => "itjobs#index" 
    get "itjobs_callback" => "itjobs#callback"

    get "after_authentication" => "authentication#after_authentication" 

    get "logout(/*url)" => "authentication#logout" 
  end

  get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  root :to => "home#index"

  match "*path" => 'error#handle404'
end
