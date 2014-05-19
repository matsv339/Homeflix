class MainController < ApplicationController
  	def index
  		if not session[:user_id]
  			redirect_to "/login"
  		end
  	end

  	def login
  		if  session[:user_id]
  			redirect_to "/index"
  		end
  	end
end
