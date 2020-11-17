class BookingsController < ApplicationController
  # user_bookings POST   /users/:user_id/bookings(.:format)                                                       bookings#create
  # new_user_booking GET    /users/:user_id/bookings/new(.:format)
  before_action :set_availability
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    current_user.is_a_cook ? @booking.cooker = current_user : @booking.booker = current_user
    
    if @booking.cooker.empty?
      if time_to_cook(@booking.number_of_meals) > @availability.end_date - @availability.start_date
        if @booking.save
          redirect_to users_path(current_user), notice: "New booking from ... to ..."
        else
          render :new 
        end
      else
        render :action => :new, :alert => "The time to cook is more than the cooker availabilities for these dates."
      end
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
    @availability = Availability.find(params[:user_id])
  end
end
