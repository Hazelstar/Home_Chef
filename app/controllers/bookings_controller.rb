class BookingsController < ApplicationController
  # user_bookings POST   /users/:user_id/bookings(.:format)
  # new_user_booking GET    /users/:user_id/bookings/new(.:format)
  before_action :set_cooker_and_availabilities, only: [:create]

  def show
    @booking = Booking.find(params[:id])
    # @booking = Booking.find(bookings_params)
    # @cooker = @booking.cooker_id
    # @user = @booking.booker_id
    @user_chatrooms = current_user.chatrooms
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.cooker = User.find(params[:booking]['cooker_id'].to_i)
    if @booking.save
      @chatroom = Chatroom.create(name: @booking.cooker.first_name, booking: @booking)
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :number_of_meals, :booker_id, :cooker_id)
  end

  def set_cooker_and_availabilities
    @cooker = User.find(params[:user_id])
    @availabilities = Availability.where(user: @cooker)
  end
end
