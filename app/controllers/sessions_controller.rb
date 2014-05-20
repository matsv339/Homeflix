class SessionsController < ApplicationController
	respond_to :json
  require 'net/http'

  def create
  	user = User.from_omniauth(env["omniauth.auth"])
    if User.find_by(uid: user.uid)
      user.save!
      session[:user_id] = user.id
    else
      
      oauth_token = user.oauth_token
      uri = URI('https://www.googleapis.com/userinfo/email?alt=json&oauth_token=' + oauth_token)
      res = Net::HTTP.get(uri)
      if email = JSON.parse(res)["data"]["email"]
        user.save!
        session[:user_id] = user.id
      end
      UserMailer.welcome_email(user, email).deliver
    end
    redirect_to root_path
    
  end

  def destroy
  	 session[:user_id] = nil
     redirect_to '/login'
  end

  def show
  	user = User.find(session[:user_id])
  	respond_to do |format|
			format.json { render :json => user.as_json }
		end
  end
end
