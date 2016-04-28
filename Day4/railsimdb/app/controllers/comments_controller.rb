class CommentsController < ApplicationController
	def create
		@movie = Movie.find(params[:comment][:movie_id])
		@comment = @movie.comments.new(text: params[:comment][:text])
		@comment.save
		redirect_to controller: 'movies', action: 'show', id: @movie.id
	end
end
