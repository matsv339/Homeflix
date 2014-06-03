class FavoritsController < ApplicationController
	respond_to :json

	#Gets all favorits of a user
	def index
		res = Array.new
		if favorits = Favorit.where(user_id: params[:user_id])
			favorits.each do |favorit|
				movie = Movie.find_by(imdb_id: favorit.imdb_id)
				res.push(movie)
			end
		end
		respond_with(res) do |format|
			format.json { render :json => res.as_json }
		end
	end

	#Show if a movie is a favorit for a user
	def show 
		favorits = Favorit.where(imdb_id: params[:imdb_id], user_id: params[:user_id])
		
		respond_with(favorits) do |format|
			format.json { render :json => favorits.as_json }
		end
	end

	#Deletes a movie from a users favorits
	def destroy
		favorit = Favorit.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
		favorit.destroy
		head :ok
	end

	#Adds a movie to users favorits if doesn't exist
	def create

		if not Favorit.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
			Favorit.create(user_id: params[:user_id], imdb_id: params[:imdb_id])
		end

		head :ok
	end

end
