class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception 

  helper_method :current_user
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def require_login 
    redirect_to root_path, notice: "Login to access page." unless is_authenticated?
  end

  def is_authenticated?
    !!session[:user_id]
  end
end
