class MoviesController < ApplicationController
	#http_basic_authenticate_with name: "didak", password:"1234", except: [:index, :show]
	before_action :authenticate_user!, except: [:index, :show]
	#should add admin permitions later!

	def index
		@movies = Movie.all
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
		params.require(:movie).permit(:name, :description, :stars, :director, :year, :image)
	end
end
