class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_present?
    if session[:user_id]
      true
    else
      false
    end
  end
  helper_method :user_present?

  def current_user
    if session[:user_id]
      current_user = User.find(session[:user_id])
    else
      false
    end
  end
  helper_method :current_user


end
