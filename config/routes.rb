Rails.application.routes.draw do
  
  # Order is important
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)  
  resources :settings
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root"
	
	#root :to => "statics#index"
	#Example of regular route:
	#get 'about' => 'pages#about', as: 'about'
	#get '/about' => 'statics#about', :as => :about
	get 'about' => 'about#index', as: 'about'
	#Example resource route
	resources :movies do
		resources :comments
		resources :reviews
	end

	get 'settings/index'
	root 'movies#index', as: 'home'
end
	