class FavoritsController < ApplicationController
	respond_to :json

	def index
		favorits = Favorit.select("movies.imdbID").joins(:movie, :user)
		
		respond_with(favorits) do |format|
			format.json { render :json => favorits.as_json }
		end
	end

	def show 
		favorits = Favorit.select("movies.imdbID").joins(:movie, :user).where("users.username = ?", params[:id])
		
		respond_with(favorits) do |format|
			format.json { render :json => favorits.as_json }
		end
	end

	def create

		# current_user = params[:user]
		# imdbID = params[:movie]
		# movie_id = Movie.select("id").where("imdbID = ?", imdbID)
		# puts current_user
		# puts indbID
		# puts "jfjfjf"
		# Favorit.create(user_id:current_user, movie_id:movie_id[0][:id])
	end

end
