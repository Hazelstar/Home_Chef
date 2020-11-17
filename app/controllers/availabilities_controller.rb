class AvailabilitiesController < ApplicationController
  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availabilities_params)
    @availability.user = current_user

    if @availability.save
      redirect_to user_availability(@cooker), notice: "New availability on #{@availability.start_date}
       for #{@cooker.first_name} registred successfully."
    else
      render :new
    end
  end

  def edit

  end

  def update
   @availability = Availability.find(params[:id])

   if @availability.update_attributes(availabilities_params)
      redirect_to user_availability
   else
      render :new
  end

  private

  def availabilities_params
    params.require(:availability).permit(:start_date, :end_date, @cooker.id)
  end
end
