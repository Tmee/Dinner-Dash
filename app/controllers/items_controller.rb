class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      flash.now[:alert] = "The item was not created. Please try again."
      render :new
    end
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to item_path(@item), notice: "You have updated an item."
    else
      flash.now[:alert] = "The item was not updated. Please try again."
      render :edit
    end

  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "The item was deleted."
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :price, :food_group)
    end
end
