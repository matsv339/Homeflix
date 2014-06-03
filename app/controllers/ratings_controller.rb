class RatingsController < ApplicationController
	
	respond_to :json
	
	#Gets the ratings for a movie
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

	#Show the users rating for a movie
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

	#Adds the rating of a movie for a user
	def create
		if not Rating.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
			Rating.create(user_id: params[:user_id], imdb_id: params[:imdb_id], rating: params[:rating])
		end

		head :ok
	end

	#Updates the rating for a users movie
	def update
		if rating = Rating.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id])
			rating.rating = params[:rating]
			rating.save
		end

		head :ok
	end

	#Gets the top "limit" movies and order by rating
	def average
		if not params[:limit]
			params[:limit] = 6
		end
		top_results = Rating.select("imdb_id, average_rating").group("imdb_id").order("average_rating desc").limit(params[:limit]).average(:rating)
		result = Array.new
		top_results.each do |key, val|
			result.push({imdb_id: key, rating: val, data: Movie.find_by(imdb_id: key)})
		end
		respond_to do |format|
			format.json { render :json => result.as_json }
		end
	end
end
