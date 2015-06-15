Railsapp::Application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  mount Railsapp::Base =>  "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"

  # API Routes
  namespace :railsapp do

    namespace :v1 do
      get "instapi" => "instapi"
      get "videoapi" => "videoapi"
      get "articleapi" => "articleapi"
      get "galleryapi" => "galleryapi"
      get "searchapi" => "searchapi"
    end
  end

  #######


  get "photo/update_status"
  get "photos/update_status"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "feed/index"
  get "feed/get_photo_feed"
  get "feed/routin_call"

  get "sessions/connect"
  get "sessions/callbackurl"


  get 'session/:action', :to => 'sessions'

  get 'session/:action', :to => 'sessions'

  get "photo/update_status/:id" => "photo#update_status", :as => 'update_status'

  get "category/update_category_status/:id" => "category#update_category_status", :as => 'update_category_status'

  get "category/update_category_feature/:id" => "category#update_category_feature", :as => 'update_category_feature'

  get "content/update_content_status/:id" => "content#update_content_status", :as => 'update_content_status'

  get "content/update_content_feature/:id" => "content#update_content_feature", :as => 'update_content_feature'

  post "content/save" => "content#save", :as => 'content_save'
#  get "admin/photos/update_status/:id" => "admin/photos#update_status", :as => 'update_status'

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

# You can have the root of your site routed with "root"
# just remember to delete public/index.html.
  root :to => "admin/dashboard#index"


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
