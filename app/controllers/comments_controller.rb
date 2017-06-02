class CommentsController < ApplicationController
	# http_basic_authenticate_with name: "didak", password:"1234", only: [:destroy]
	before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@movie = Movie.find(params[:movie_id])
		@commet = @movie.comments.create(comment_params)
		#migth need some fix using current id not last (couse semultanios uppdates)
		@com = Comment.last
		@com = @com.update(username: current_user.username)
		redirect_to movie_path(@movie)

	end

	def destroy
		@movie = Movie.find(params[:movie_id])
		@comment = @movie.comments.find(params[:id])
		@comment.destroy
		redirect_to movie_path(@movie)
	end

	private def comment_params
		#params.require(:comment).permit(:username, :body)
		params.require(:comment).permit(:body)
	end
end
