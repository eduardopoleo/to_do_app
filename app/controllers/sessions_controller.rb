class SessionsController < ApplicationController 
  def new
    @user = User.new
    render 'users/new'
  end

  def create
    user = User.where(user_name: params[:user_name]).first 

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to projects_path
    else
      flash[:danger] = 'Your username or your password do not match'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to login_path
  end
end