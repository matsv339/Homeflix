class ProfilesController < ApplicationController

	respond_to :json

	def last_watched
		last_movies = Progress.where(user_id: params[:user_id]).limit(6).order("updated_at desc")
		movies = Array.new
		last_movies.each do |last_movie|
			movie = Movie.find_by(imdb_id: last_movie.imdb_id)
			res = {data: movie, progress: last_movie.progress}
			movies.push(res)
		end

		respond_with(movies) do |format|
			format.json { render :json => movies.as_json }
		end
	end

end
