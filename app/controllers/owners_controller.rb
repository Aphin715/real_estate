class OwnersController < ApplicationController

  def new
    @owner = Owner.new
  end

  def show
    @owner = Owner.find(params[:id])
  end

def index
  @owner = Owner.all
end

 def create
    @building = Building.find(params[:building_id])
    @owner = @building.owners.build(owner_params)

    if @owner.save
      redirect_to owner_path(@owner), notice: "Owner Recorded."
    else
      render :new
    end
  end



protected
 def owner
    @owner ||= Owner.all
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company_name)
  end
end


