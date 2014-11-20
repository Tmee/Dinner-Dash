class FillingsController < ApplicationController

  before_action :set_filling, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  def index
    @fillings = Filling.all
  end

  def show
  end

  def new
    @filling = Filling.new
  end

  def edit
  end

  def create
    @filling = Filling.new(filling_params)

    if @filling.save
      redirect_to @filling, notice: 'Filling was successfully created.'
    else
      flash.now[:alert] = "The filling was not created. Please try again."
      render :new
    end
  end

  def update
    if @filling.update_attributes(filling_params)
      redirect_to filling_path(@filling), notice: "You have updated a filling."
    else
      flash.now[:alert] = "The filling was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @filling.destroy
    redirect_to fillings_path, notice: "The filling was deleted."
  end

  private

    def set_filling
      @filling = Filling.find(params[:id])
    end

    def filling_params
      params.require(:filling).permit(:title, :description, :price, :food_group, :image)
    end
end
