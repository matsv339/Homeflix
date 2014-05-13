class MoviesController < ApplicationController
	respond_to :json

	def index
		movies = Movie.all

		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

	def last
		movies = Movie.limit(5).order("created_at desc")
		
		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

	def search 

		movies = Movie.search(params[:key])
		
		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

	def genre 
		movies = Movie.genreSearch(params[:genre])

		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

end
