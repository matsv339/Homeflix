class SessionsController < ApplicationController
	respond_to :json

  def create
  	user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
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
