class SessionsController < ApplicationController
  def new
    @user = User.new
    render layout: false
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "You have successfully logged out."
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
