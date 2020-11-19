class BookingsController < ApplicationController
  # user_bookings POST   /users/:user_id/bookings(.:format)                                                       bookings#create
  # new_user_booking GET    /users/:user_id/bookings/new(.:format)
  before_action :set_cooker_and_availabilities

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.cooker = @cooker
    
    if @booking.save
      redirect_to profile_path, notice: "New booking added on #{@booking.start_date} with #{@booking.cooker.first_name.capitalize} #{@booking.cooker.last_name.capitalize}"
    else
      render :new 
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

  def set_cooker_and_availabilities
    @cooker = User.find(params[:user_id])
    @availabilities = Availability.where(user: @cooker)
  end
end
