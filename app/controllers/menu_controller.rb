class MenuController < ApplicationController

    def show
      @filling_names = @item.fillings.map {|filling| filling.title }
    end

    def new
      @item = Item.new
      @all_fillings = Filling.all
    end




    def destroy
      @item.destroy
      redirect_to items_path, notice: "The product was deleted."
    end

######################################
#### View all menu items methods  ####
######################################

    def index
      @items    = Item.all
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
