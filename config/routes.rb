Rails.application.routes.draw do
  
  #get 'payment_select/select_plan'

  get '/select_plan' => 'payment_select#select_plan', as: :select_plan
  #get 'payment_select/select_monthly_subscription'
  get '/select_monthly_subscription' => 'payment_select#select_monthly_subscription', as: :select_monthly_subscription
  get 'select_movies/index'

  # Order is important
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root"
	
	#root :to => "statics#index"
	#Example of regular route:
	#get 'about' => 'pages#about', as: 'about'
	#get '/about' => 'statics#about', :as => :about
	get 'about' => 'about#index', as: 'about'
	get 'settings/index'
	get 'movies/index_search' => 'movies#index_search'
	#Example resource route
	resources :movies do
		resources :comments
		resources :reviews
	end
	
  resources :settings
  resources :charges
	resources :select_movies, only: :index
	
	root 'movies#index', as: 'home'
	#added for method root_path (search)
	root :to => "movies#index"

	require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
	