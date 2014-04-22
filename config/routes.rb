Epione::Application.routes.draw do

	resources :quick_diagnoses, only: [:new, :create, :update]
	get '/quick_diagnoses/:id/correct', to: 'quick_diagnoses#correct', as: 'correct_quick_diagnosis'

	resources :quick_test_faqs, only: [:new, :create]
	resources :quick_test_minimentals, only: [:new, :create]

  resource :support, only: [:new]

	resource :contact_form, only: [:create]

  # the following solution was found in http://stackoverflow.com/questions/3791096/devise-logged-in-root-route-rails-3
  authenticated :physician do
    root :to => "quick_diagnoses#new"
  end
  unauthenticated :physician do
    devise_scope :physician do
      get "/" => "devise/sessions#new"
    end
  end

	devise_for :physicians, :skip => [:registrations] # this lines and the below disable registration and allow only edit profile refer: http://stackoverflow.com/questions/6734323/how-do-i-remove-the-devise-route-to-sign-up
	as :physician do
		get 'physicians/edit' => 'devise/registrations#edit', :as => 'edit_physician_registration'
		put 'physicians' => 'devise/registrations#update', :as => 'physician_registration'
	end

  devise_for :admins  # This line has to be above mount RailsAdmin::Engine , if not , it makes an endless loop.

  mount RailsAdmin::Engine => '/administrator', :as => 'rails_admin'



end
