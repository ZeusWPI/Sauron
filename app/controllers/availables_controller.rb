class AvailablesController < ApplicationController
  before_action :set_variables, only: [:new, :create]

  def new
  end

  def create
    available = @edition.items.build available_params
    if available.save
      redirect_to @edition
    else
      render :new
    end
  end

  def destroy
    available = Available.find params[:id]
    available.destroy
    redirect_to available.event
  end

  private

  def set_variables
    @items = Item.joins('LEFT JOIN availables ON availables.item_id = items.id AND availables.edition_id = 1')
      .includes(:availables)
      .select{ |a| a.availables.empty? }
    @edition = Edition.find params[:edition_id]
  end

  def available_params
    params.require(:available).permit(:item_id)
  end
end
