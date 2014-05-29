class MainController < ApplicationController
  	def index
  		if not User.find_by(id: session[:user_id])
        session.clear
        redirect_to "/login"
      end
  	end

  	def login
  		if session[:user_id]
  			redirect_to "/"
  		end
  	end
end
