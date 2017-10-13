class EditionsController < ApplicationController
  def new
    @edition = Edition.new
  end

  def create
    @edition = Edition.new edition_params
    if @edition.save
      redirect_to editions_path
    else
      render :new
    end
  end

  def show
    @edition = Edition.find params[:id]
  end

  def edit
    @edition = Edition.find params[:id]
  end

  def update
    @edition = Edition.find params[:id]
    if @edition.update edition_params
      redirect_to editions_path
    else
      render :edit
    end
  end

  def index
    @editions = Edition.all
  end
end
