class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :current_user, :ensure_login
  protect_from_forgery with: :exception
  
  helper_method :logged_in?, :current_user, :ensure_login
  
  def logged_in?
    @current_user != nil
  end
  
  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
  
  def ensure_login
    unless logged_in?
      redirect_to(login_path)
    end
  end
end
