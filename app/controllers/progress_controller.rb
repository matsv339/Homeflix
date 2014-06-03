class ProgressController < ApplicationController
	
	respond_to :json

	#Show the progress of a specific movie for a user
	def show
		progress = Progress.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])

		respond_to do |format|
			format.json { render :json => progress.as_json }
		end
	end

	#Adds the progress of a movie for a user
	def create
		if not Progress.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
			Progress.create(user_id: params[:user_id], imdb_id: params[:imdb_id], progress: params[:progress])
		end

		head :ok
	end

	#Updates the progress of a movie for a user
	def update
		if progress = Progress.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
			progress.progress = params[:progress]
			progress.save
		else
			Progress.create(user_id: params[:user_id], imdb_id: params[:imdb_id], progress: params[:progress])
		end

		head :ok
	end

	#Deletes the progress of a movie for a user
	def destroy
		if progress = Progress.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
			progress.destroy
		end

		head :ok
	end

end
