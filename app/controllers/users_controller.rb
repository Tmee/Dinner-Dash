class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User created. Please log in."
    else
      flash.now[:notice] = "User could not be created."
      render :new    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "You have updated a user."
    else
      flash.now[:alert] = "The user was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    
    @user.destroy
    redirect_to users_path, notice: "The user was deleted."
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email, :username, :password, :password_confirmation)
  end
end
