class MoviesController < ApplicationController
	respond_to :json

	def index
		puts "test"
		movies = Movie.all
		puts "test2"
		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

end
