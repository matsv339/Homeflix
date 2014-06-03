class MoviesController < ApplicationController
	respond_to :json

	#Gets all movies
	def index
		movies = Movie.all

		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

	#Gets the latest movies
	def last
		movies = Movie.limit(5).order("created_at desc")
		
		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

	#Gets the movies the matches the search parameters
	def search 
		movies = Movie.search(params[:key])
	
		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

	#Gets the movies woth the correct genre
	def genres
		data = Array.new
		genres = Genre.all
		genres.each do |genre|
			movies_in_genre = Movie.genreSearch(genre.name)
			data.push({name: genre.name, data: movies_in_genre})
		end

		respond_with(data) do |format|
			format.json { render :json => data.as_json }
		end
	end

end
