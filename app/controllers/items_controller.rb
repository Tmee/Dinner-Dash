class ItemsController < ApplicationController

    def index
      @items = Item.all
    end

    def show
      @item = Item.find(params[:id])
    end

    def new
      @item = Item.new
    end

    def edit
      @item = Item.find(params[:id])
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
      @item = item.find(params[:id])

      if @item.update_attributes(item_params)
        redirect_to item_path(@item), notice: "You have updated a product."
      else
        flash.now[:alert] = "The product was not updated. Please try again."
        render :edit
      end
    end

    def destroy
      @item = Item.find(params[:id])

      @item.destroy
      redirect_to items_path, notice: "The product was deleted."
    end

    private

    def item_params
      params.require(:item).permit(:name, :price)
    end
end
