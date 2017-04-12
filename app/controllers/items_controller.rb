 class ItemsController < ApplicationController
   def create
    item = Item.new item_params
    if item.save
      render json: item
    else
      render json: item.errors
    end
   end

   def index
     @items = Item.all
   end

   private

   def item_params
     params.require(:item).permit(:name, :description, :price_cents, :category_id, :items_attributes)
   end
 end
