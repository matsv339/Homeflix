class CommentsController < ApplicationController

	respond_to :json

	def index
		comments = Comment.where(imdb_id: params[:imdb_id]).order(created_at: :desc)
		ret = Array.new

		comments.each do |comment|
			# user = User.where(id: comment.user_id).select("name")
			user = User.find(comment.user_id)
			res = {"id" => comment.id, "user_id" => comment.user_id, "imdb_id" => comment.imdb_id, "content" => comment.content, "name" => user.name, "created_at" => comment.created_at}		
			ret.push(res)
		end
		respond_with(ret) do |format|
			format.json { render :json => ret.as_json }
		end
	end

	def destroy
		comment = Comment.find_by(imdb_id: params[:imdb_id], user_id: params[:user_id], id: params[:comment_id])
		comment.destroy
		head :ok
	end

	def create
		Comment.create(user_id: params[:user_id], imdb_id: params[:imdb_id], content: params[:content])

		head :ok
	end

end
