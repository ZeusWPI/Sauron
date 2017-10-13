class PartnersController < ApplicationController
  def new
    @edition = Edition.find params[:edition_id]
    @partner = @edition.partners.build
  end

  def create
    @edition = Edition.find params[:edition_id]
    @partner = @edition.partners.build partner_params
    if @partner.save
      redirect_to @edition
    else
      render :new
    end
  end

  def show
    @partner = Partner.find params[:id]
  end

  def edit
    @partner = Partner.find params[:id]
  end

  def update
    @partner = Partner.find params[:id]
    if @partner.update partner_params
      redirect_to edition_partners_path(@partner.edition_id)
    else
      render :edit
    end
  end

  private

  def partner_params
    params.require(:partner).permit(:name)
  end
end
