class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :intercept_html_requests

  helper_method :current_user
 
  #Don't use this anymore
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    redirect_to 'http://www.google.com'
  end

 
  
  def intercept_html_requests
  	render("main/index.html") if request.format == Mime::HTML
  end

end
