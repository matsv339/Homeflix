class MoviesController < ApplicationController
	respond_to :json
	# require 'net/http'

	def index
		movies = Movie.all
		
		# If we want to return complete array with IMDB data. This was alot slower.
		
		# result = Array.new
		# movies.each do |item|
		# 	result.push(Net::HTTP.get(URI.parse('http://www.omdbapi.com?i=tt0111161')))
		# end

		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

	def last
		movies = Movie.limit(3).order("created_at desc")
		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

end
