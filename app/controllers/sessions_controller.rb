class SessionsController < ApplicationController
	respond_to :json
  require 'net/http'

  def create
  	user = User.from_omniauth(env["omniauth.auth"])
    if User.find_by(uid: user.uid)
      user.save!
      session[:user_id] = user.id
    else
      user.save!
      session[:user_id] = user.id
      oauth_token = user.oauth_token
      uri = URI('https://www.googleapis.com/userinfo/email?alt=json&oauth_token=' + oauth_token)
      res = Net::HTTP.get(uri)
      email = JSON.parse(res)["data"]["email"]
      UserMailer.welcome_email(user, email).deliver
    end
    redirect_to '/index'
  end

  def destroy
  	 session[:user_id] = nil
    redirect_to root_path
  end

  def show
  	user = User.find(session[:user_id])
  	respond_to do |format|
			format.json { render :json => user.as_json }
		end
  end
end
