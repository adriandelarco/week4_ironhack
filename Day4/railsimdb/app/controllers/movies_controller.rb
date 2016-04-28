class MoviesController < ApplicationController
	def index
	end
	def search
		@keyword = params[:search][:keyword]
		@search_results = Movie.find_movies(@keyword)
		if @search_results[1] == "db"
			redirect_to controller: 'movies', action: 'show', id: @search_results[0].id
		else
			render :index
		end
	end
	def show
		@movie = Movie.find(params[:id])
		@comments = @movie.comments.all
	end
	def create
		@movie = Movie.new movie_params
		if @movie.save
			redirect_to controller: 'movies', action: 'show', id: @movie.id
		end
	end

	private
	def movie_params
		params.require(:movie).permit(:title,:poster,:year, :plot)
	end
end
