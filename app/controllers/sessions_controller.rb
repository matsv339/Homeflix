class SessionsController < ApplicationController
    respond_to :json
    require 'net/http' # Enables http requests

    # This is where the respons from google end up.
    def create
        # Create a user object from the return
        user = User.from_omniauth(env["omniauth.auth"])
        # If there is a user in the database save it and create session. (User all ready signed up).
        if User.find_by(uid: user.uid)
            user.save!
            session[:oauth_token] = user.oauth_token
        # Create new user (User is new).
        else
            # Fetch the users email from google
            oauth_token = user.oauth_token
            uri = URI('https://www.googleapis.com/userinfo/email?alt=json&oauth_token=' + oauth_token)
            res = Net::HTTP.get(uri)
            # If there is a return email from google, save user and create session and send welcome email.
            if email = JSON.parse(res)["data"]["email"]
                user.save!
                session[:oauth_token] = user.oauth_token
                UserMailer.welcome_email(user, email).deliver
            end
        end
        # Redirect to root.
        redirect_to root_path
    end

    def destroy
        # Clear the session and redirect to login.
        # Does not clear google sign in.
        session.clear
        redirect_to '/login'
    end

    def show
        # Returns the user that is signed in.
        user = User.find_by(oauth_token: session[:oauth_token])
        respond_to do |format|
            format.json { render :json => user.as_json }
        end
    end
end
