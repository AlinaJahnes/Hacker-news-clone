class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # If you switch this to User.find_by so that it returns nil, you may not need to have line 8 in a conditional at all.
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
end
