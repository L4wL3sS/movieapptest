class SelectMoviesController < ApplicationController
	before_action :authenticate_user!
	
  def index
		@movies = Movie.all
 		
		if params[:search]
			@movies = Movie.search(params[:search]).order("created_at DESC")			
		elsif params[:search_director]
			@movies = Movie.search_director(params[:search_director]).order("created_at DESC")
			
		elsif params[:search_year]
			@movies = Movie.search_year(params[:search_year]).order("created_at DESC")
			
		elsif params[:search_genre]
			@movies = Movie.search_genre(params[:search_genre]).order("created_at DESC")
		end

	end
end
