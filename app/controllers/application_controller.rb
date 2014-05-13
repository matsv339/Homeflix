class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :intercept_html_requests

  helper_method :current_user
  helper_method :check_login
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

 

  def intercept_html_requests
  	render("main/index.html") if request.format == Mime::HTML
  end

end
