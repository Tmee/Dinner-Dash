class AdminController < ApplicationController
  def fillings
    @fillings = Filling.all
    @items = Items.all
    @user = User.find_by(session[:user_id])
  end

  def dashboard
    @user = User.find_by(session[:user_id])
  end
end
