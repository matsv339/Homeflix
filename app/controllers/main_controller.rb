class MainController < ApplicationController
    
    def index
        # If no user with session redirecto to login.
        puts "Enter index"
        puts session[:oauth_token]
        if not User.find_by(oauth_token: session[:oauth_token])
            session.clear
            redirect_to "/login"
        end    
    end

    def login
        # Check if there is a session
        if session[:oauth_token]
            # If there is a logedin user, redirect to root.
            if User.find_by(oauth_token: session[:oauth_token])
                redirect_to "/"
            # If not clear invalid session.
            else
                session.clear
            end
        end
    end
end
