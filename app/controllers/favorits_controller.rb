class FavoritsController < ApplicationController
	respond_to :json

	def index
		favorits = Favorit.all
		
		respond_with(favorits) do |format|
			format.json { render :json => favorits.as_json }
		end
	end

	def check 
		user_id = params[:user_id]
		imdb_id = params[:imdb_id]

		favorits = Favorit.find_by(imdb_id: imdb_id, user_id: user_id)
		
		respond_with(favorits) do |format|
			format.json { render :json => favorits.as_json }
		end
	end

	def destroy
		user_id = params[:user_id]
		imdb_id = params[:imdb_id]
		Favorit.delete_all("user_id = ? AND imdb_id = ?", user_id, imdb_id)
	end

	def create
		user_id = params[:user_id]
		imdb_id = params[:imdb_id]

		if not Favorit.find_by(imdb_id: imdb_id, user_id: user_id)
			Favorit.create(user_id: user_id, imdb_id: imdb_id)
		end

		redirect_to "/"
	end

end
