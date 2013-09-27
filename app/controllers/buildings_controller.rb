class BuildingsController < ApplicationController
helper_method :buildings

  def new
    @building = Building.new
  end

  def index
    @building = Building.all
  end

  def show

    @building = Building.find(params[:id])
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to '/buildings/:building_id/owners/new', notice: 'Building recorded.'
    else
      render :new
    end
  end

protected
  def building_params
    params.require(:building).permit(:address, :city, :state, :postal_code, :description, :owner_id)
  end
end


