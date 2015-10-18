class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      if user_params[:name].empty?
        redirect_to mr_signy_path(@notice), :notice => "Please fill in a first name."
      elsif user_params[:email].empty?
        redirect_to mr_signy_path(@notice), :notice => "Please fill in an email."
      elsif user_params[:password].empty? || user_params[:password_confirmation].empty?
        redirect_to mr_signy_path(@notice), :notice => "Please fill in both password fields."
      elsif user_params[:password] != user_params[:password_confirmation]
        redirect_to mr_signy_path(@notice), :notice => "It seems your passwords aren't the same..."
      else
        redirect_to mr_signy_path(@notice), :notice => "It looks like that email is taken, sorry." 
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :email, :password_confirmation)
  end
end
