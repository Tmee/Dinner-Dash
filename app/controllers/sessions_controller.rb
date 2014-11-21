class SessionsController < ApplicationController

  def new
    @user = User.new
  end



  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :back, notice: "Welcome to Los Amigos Gordos, #{user.first_name}."
    else
      redirect_to root_path
      flash[:error]
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "You are logged out."
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
