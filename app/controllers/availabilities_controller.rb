class AvailabilitiesController < ApplicationController
  def show
    @availabilities.all
  end

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availabilities_params)

    if @availability.save
      flash[:notice] = "New availability added!"
      redirect_to user_availability(@cooker)
    else
      flash[:error] = "Error adding availability"
      render :new
    end
  end

  def edit
    @availability = Availability.find(params[:id])
  end

  def update
    @availability = Availability.find(params[:id])

    if @availability.update_attributes(availabilities_params)
      flash[:notice] = "Your ailability is updated!"
      redirect_to user_availability
    else
      flash[:error] = "Error updating availability"
      render :show
    end
  end

  private

  def availabilities_params
    params.require(:availability).permit(:start_date, :end_date, @cooker.id)
  end
end
