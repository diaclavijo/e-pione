Epione::Application.routes.draw do
  resources :quick_diagnoses

  resources :consultations, only: [] do
    resources :test_minimentals, only: [:new, :create, :show, :destroy]
    resources :test_relojs, only: [:new, :create, :show, :destroy]
    resources :test_faqs, only: [:new, :create, :show, :destroy]
    resources :additional_tests, only: [ :index ]
    resource :computer_diagnoses, only: [ :new, :create ]
    resource :human_diagnoses, only: [ :new, :create ]
  end


  resource :contacts, only: [:new]

  resources :patients  do
    resources :consultations, only: [:create, :new, :index, :show, :edit, :update]
    get 'full-history', to: 'history#index', as: 'full_history'
  end

  # the following solution was found in http://stackoverflow.com/questions/3791096/devise-logged-in-root-route-rails-3
  authenticated :physician do
    root :to => "home#index"
  end
  unauthenticated :physician do
    devise_scope :physician do
      get "/" => "devise/sessions#new"
    end
  end

  devise_for :physicians, controllers: {:sessions => "physicians/sessions"}

  devise_for :admins  # This line has to be above mount RailsAdmin::Engine , if not , it makes an endless loop.

  mount RailsAdmin::Engine => '/administrator', :as => 'rails_admin'



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
