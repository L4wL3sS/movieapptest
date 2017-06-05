Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root"
	root 'movies#index', as: 'home'
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

	resources :settings
	get 'settings/index'

end
	