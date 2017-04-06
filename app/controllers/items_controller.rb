 class ItemsController < ApplicationController
   def index
     @items = Item.all
     @item = Item.new
   end
 end
