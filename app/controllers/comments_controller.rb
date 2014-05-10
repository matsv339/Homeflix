class CommentsController < ApplicationController

	respond_to :json

	def index
		puts params[:imdb_id]
		comments = Comment.where(imdb_id: params[:imdb_id])
		
		respond_with(comments) do |format|
			format.json { render :json => comments.as_json }
		end
	end

	def destroy
		comment = Comment.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id], id: params[:comment_id])
		comment.destroy
		head :ok
	end

	def create

		comment = Comment.create(user_id: params[:user_id], imdb_id: params[:imdb_id], content: params[:content])

		head :ok
	end

end
