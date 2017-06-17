class MoviesController < ApplicationController
	#http_basic_authenticate_with name: "didak", password:"1234", except: [:index, :show]
	before_action :authenticate_user!, except: [:index, :show]
	#should add admin permitions later!

	def index
		@movies = Movie.all

 		
		if params[:search]
			@movies = Movie.search(params[:search]).order("created_at DESC")
			@@my_value=@movies
			redirect_to movies_index_search_path			
			
		elsif params[:search_director]
			#redirect_to movies_index_search_path
			@movies = Movie.search_director(params[:search_director]).order("created_at DESC")
			@@my_value=@movies
			redirect_to movies_index_search_path
			
		elsif params[:search_year]
			#redirect_to movies_index_search_path
			@movies = Movie.search_year(params[:search_year]).order("created_at DESC")
			@@my_value=@movies
			redirect_to movies_index_search_path
			
		elsif params[:search_genre]
			#redirect_to movies_index_search_path
			@movies = Movie.search_genre(params[:search_genre]).order("created_at DESC")
			@@my_value=@movies
			redirect_to movies_index_search_path
		end
	end

	def index_search
		@movies_s = @@my_value
 
		if params[:search]
			@movies_s = Movie.search(params[:search]).order("created_at DESC")
		elsif params[:search_director]
			@movies_s = Movie.search_director(params[:search_director]).order("created_at DESC")
		elsif params[:search_year]
			@movies_s = Movie.search_year(params[:search_year]).order("created_at DESC")
		elsif params[:search_genre]
			@movies_s = Movie.search_genre(params[:search_genre]).order("created_at DESC")
		end
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def new
		@movie = Movie.new
	end

	def create
		#render plain: params[:movie].inspect
		@movie = Movie.new(movie_params)

		if(@movie.save)
			redirect_to @movie
		else
			render 'new'
		end
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])

		if(@movie.update(movie_params))
			redirect_to @movie
		else
			render 'edit'
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		redirect_to movies_path
	end

	private 

	def movie_params
		params.require(:movie).permit(:name, :description, :stars, :director, :year, :image, :genre, :url)
	end
end
