class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  def new
  end

  def create
    @username = params[:user][:username]
    @password = params[:user][:password]
    
    @user = User.find_by(username: @username)
    if !@user.nil? && @user.authenticate(@password)
      session[:current_user_id] = @user.id
      redirect_to(root_path, notice: "Logged in successfully")
    else
      redirect_to(login_path, notice: "Wrong Credentials")
    end
    
  end

  def destroy
    if @current_user
      reset_session
    end
    redirect_to(login_path, notice: "Logged out successfully")
  end
end
