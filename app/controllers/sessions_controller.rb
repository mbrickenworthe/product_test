class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Welcome back, #{@user.name}"
    else
      redirect_to mr_logy_path, :notice => "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have successfully logged out!"
  end

end
