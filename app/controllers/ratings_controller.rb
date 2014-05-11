class RatingsController < ApplicationController
	
	respond_to :json
	
	def index
		ratings = Rating.where(imdb_id: params[:imdb_id])
		count = 0
		total_rating = 0
		ratings.each do |item|
			total_rating = total_rating + item.rating
			count = count + 1
		end
		if count == 0
			average = 0
		else
			average = total_rating / count
		end
		
		result = {"average" => average, "votes" => count}
		respond_to do |format|
			format.json { render :json => result.as_json }
		end
	end

	def show 
		if rating = Rating.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
			result = rating
		else
			result = {"respons" => "null"}
		end
		respond_to do |format|
			format.json { render :json => result.as_json }
		end
	end

	def create
		if not Rating.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
			Rating.create(user_id: params[:user_id], imdb_id: params[:imdb_id], rating: params[:rating])
		end

		head :ok
	end

	def update
		if rating = Rating.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
			rating.rating = params[:rating]
			rating.save
		end

		head :ok
	end
end
