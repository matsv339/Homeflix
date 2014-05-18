class MainController < ApplicationController
  	def index
  		if not session[:user_id]
  			redirect_to root_path
  		end
  	end
end
