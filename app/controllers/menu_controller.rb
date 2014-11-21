class MenuController < ApplicationController

    def index
      @items = Item.all
      @all_fillings = Filling.all
    end

    def show
      @filling_names = @item.fillings.map {|filling| filling.title }
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

      if @item.save
        redirect_to @item, notice: "Item created. Please log in."
      else
        flash.now[:notice] = "Item could not be created."
        render :new
      end
    end

    def update
      @all_fillings = Filling.all
      if @item.update_attributes(item_params)
        @item.filling_ids = params[:item][:filling_ids]
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

######################################
#### View all menu items methods  ####
######################################

    def menu_items
      @fillings = Filling.all
      @meats    = find_meat_items(@fillings)
      @veggies  = find_veggies_items(@fillings)
      @extras   = find_extras(@fillings)
      @salsas   = fine_salsa_items(@fillings)
    end

    def find_meat_items(db)
      db.select { |f| f.food_group == 'meat'}
    end

    def find_veggies_items(db)
      db.select { |f| f.food_group == 'veggies'}
    end

    def find_extras(db)
      db.select { |f| f.food_group == 'extras'}
    end

    def fine_salsa_items(db)
      db.select { |f| f.food_group == 'salsas'}
    end

#### end menu item methods ####

    private

    def item_params
      params.require(:item).permit(:name, :price, :filling_ids)
    end

    def set_item
      @item = Item.find(params[:id])
    end


end
