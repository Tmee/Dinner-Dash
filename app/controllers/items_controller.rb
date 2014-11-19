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
        redirect_to @item, notice: "Item created. Please log in."
      else
        flash.now[:notice] = "Item could not be created."
        render :new
      end
    end

    def update
      if @item.update_attributes(item_params)
        redirect_to item_path(@item), notice: "You have updated a product."
      else
        flash.now[:alert] = "The product was not updated. Please try again."
        render :edit
      end
    end

    def destroy
      @item.destroy
      redirect_to items_path, notice: "The product was deleted."
    end

    private

    def item_params
      params.require(:item).permit(:name, :price)
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
