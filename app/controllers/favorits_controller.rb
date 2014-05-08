class FavoritsController < ApplicationController
	respond_to :json


	def index
		puts params[:user_id]
		favorits = Favorit.where(user_id: params[:user_id])
		
		respond_with(favorits) do |format|
			format.json { render :json => favorits.as_json }
		end
	end

	def show 
		favorits = Favorit.where(imdb_id: params[:imdb_id], user_id: params[:user_id])
		
		respond_with(favorits) do |format|
			format.json { render :json => favorits.as_json }
		end
	end

	def destroy
		favorit = Favorit.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
		favorit.destroy
		head :ok
	end

	def create

		if not Favorit.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
			Favorit.create(user_id: params[:user_id], imdb_id: params[:imdb_id])
		end

		head :ok
	end

end
