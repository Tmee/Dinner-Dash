class Admin::ItemsController < Admin::BaseAdminController

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  layout 'admin'

    def index
      @items = Item.all
      @all_fillings = Filling.all
    end

    def show
      @filling_names = @item.fillings.map {|filling| filling.title }.uniq
    end

    def new
      @item = Item.new
      @all_fillings = Filling.all
    end

    def edit
      @all_fillings = Filling.all
    end

    def create
      @item = Item.new(item_params)
      @item.filling_ids = params[:item][:filling_ids]
      if @item.save
        redirect_to admin_items_path, notice: "Item created."
      else
        flash.now[:notice] = "Item could not be created."
        @all_fillings = Filling.all
        render :new
      end
    end

    def update
      @all_fillings = Filling.all
      if @item.update_attributes(item_params)
        @item.filling_ids = params[:item][:filling_ids]
        redirect_to admin_item_path(@item), notice: "You have updated a product."
      else
        flash.now[:alert] = "The product was not updated. Please try again."
        render :edit
      end

    end

    def destroy
      if @item.line_items.empty?
        @item.destroy
        redirect_to admin_items_path, notice: "The product was deleted."
      else
        redirect_to admin_items_path, notice: "Unauthorized. This Item is in an existing order."
      end
    end

    private

    def item_params
      params.require(:item).permit(:name, :price, :filling_ids, :image)
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
