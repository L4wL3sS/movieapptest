class ReviewsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.create(review_params)
		#migth need some fix using current id not last (couse semultanios uppdates)
		@com = Review.last
		@com = @com.update(username: current_user.username)
		redirect_to movie_path(@movie)
	end

	def destroy
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.find(params[:id])
		@review.destroy
		redirect_to movie_path(@movie)
	end

	private def review_params
		#params.require(:review).permit(:username, :body)
		params.require(:review).permit(:body, :rating)
	end
end
