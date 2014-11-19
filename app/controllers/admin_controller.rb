class AdminController < ApplicationController
  before_action :require_admin


  def fillings
    @fillings = Filling.all
    @items = Item.all
    #@user = User.find_by(session[:user_id])
  end

  def dashboard
   # @user = User.find_by(session[:user_id])
  end
end
