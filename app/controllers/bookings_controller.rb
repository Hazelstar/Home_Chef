class BookingsController < ApplicationController
  # user_bookings POST   /users/:user_id/bookings(.:format)                                                       bookings#create
  # new_user_booking GET    /users/:user_id/bookings/new(.:format)
  before_action :set_availability, :set_cooker

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.cooker = @cooker
    
    if bookable?
      if @booking.save
        redirect_to profile_path, notice: "New booking from #{@booking.start_date} to #{@booking.start_date + time_to_cook(@booking.number_of_meals)}"
      else
        render :new 
      end
    else
      render :action => :new, :alert => "The time to cook is more than the cooker availabilities for these dates."
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :number_of_meals, :booker_id, :cooker_id)
  end

  def time_to_cook(meals)
    # 10 min preparation time + 30 min per meal
    10 + 30 * meals
  end

  def set_availability
    @availability = Availability.find(@cooker)
  end

  def bookable?
    period_matching = time_to_cook(@booking.number_of_meals) > (@availability.end_date - @availability.start_date)
    same_starting_date = @booking.start_date == @availability.start_date
    period_matching && same_starting_date
  end

  def set_cooker
    @cooker = User.find(params[:user_id])
  end
end
