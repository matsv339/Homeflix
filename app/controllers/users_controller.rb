class UsersController < ApplicationController
	respond_to :json

	#Is not used, only for development
	def index
		users = User.all

		respond_with(users) do |format|
			format.json { render :json => users.as_json }
		end
	end

	def create
		
	end
end
