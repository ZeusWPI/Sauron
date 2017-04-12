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
     @items = Item.where(parent: nil)
   end

   private

   def item_params
     params.require(:item).permit(*item_fields, :type, items_attributes: [*item_fields])
   end

  def item_fields
    [:name, :description, :price_cents, :category_id]
  end
 end
