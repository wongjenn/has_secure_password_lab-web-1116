class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: user_params[:name])

    if @user != nil && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Username or password was incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out!"
    redirect_to login_path
  end

private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end

end
