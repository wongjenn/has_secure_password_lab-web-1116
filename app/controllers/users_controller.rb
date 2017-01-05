class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.password != @user.password_confirmation
      flash[:notice] = "Passwords do not match. Please try again."
      redirect_to signup_path and return
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end
private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
