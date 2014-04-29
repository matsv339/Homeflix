class MoviesController < ApplicationController
	respond_to :json

	def index
		movies = Movie.all

		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end
end
