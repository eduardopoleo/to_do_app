class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)

    if @user.save
      redirect_to root_path
      flash[:notice] = "Your account was successfully created"
    else
      render 'new'
    end
  end

  private

  def set_params
    params.require(:user).permit(:user_name, :email)
  end
end