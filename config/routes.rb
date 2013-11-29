RailsSIAD::Application.routes.draw do



  resources :consultations, only: [] do
    get 'cognitive_symptomatology', to: 'cognitive_symptomatologies#new_or_edit', as: 'cognitive_symptomatology'
    post 'cognitive_symptomatology', to: 'cognitive_symptomatologies#create', as: nil
    patch 'cognitive_symptomatology', to: 'cognitive_symptomatologies#update', as: nil

    resources :test_minimentals, only: [:new, :create, :show]
    resources :test_iqcodes, only: [:new, :create, :show]
    resources :test_mecs, only: [:new, :create, :show]
    resources :test_pfeiffers, only: [:new, :create, :show]
    resources :test_relojs, only: [:new, :create, :show]

    get 'no_cognitive_symptomatology', to: 'no_cognitive_symptomatologies#new_or_edit', as: 'no_cognitive_symptomatology'
    post 'no_cognitive_symptomatology', to: 'no_cognitive_symptomatologies#create', as: nil
    patch 'no_cognitive_symptomatology', to: 'no_cognitive_symptomatologies#update', as: nil

    resources :test_yesavage4s, only: [:new, :create, :show]
    resources :test_yesavage10s, only: [:new, :create, :show]
    resources :test_yesavage15s, only: [:new, :create, :show]
    resources :test_yesavage30s, only: [:new, :create, :show]
    resources :test_npis, only: [:new, :create, :show]

    get 'exploracion_funcional', to: 'exploracion_funcional#show', as: 'exploracion_funcional'
    resources :test_barthels, only: [:new, :create, :show]

    get 'neurological_examination', to: 'neurological_examinations#new_or_edit', as: 'neurological_examination'
    post 'neurological_examination', to: 'neurological_examinations#create', as: nil
    patch 'neurological_examination', to: 'neurological_examinations#update', as: nil

    get 'physical_examination', to: 'physical_examinations#new_or_edit', as: 'physical_examination'
    post 'physical_examination', to: 'physical_examinations#create', as: nil
    patch 'physical_examination', to: 'physical_examinations#update', as: nil



  end



  get 'diagnosis', to: 'diagnoses#diagnosis', as: 'diagnosis'


  resources :patients  do
    resources :consultations, only: [:create, :new, :index, :show, :edit, :update]
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
