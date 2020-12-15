class BookingsController < ApplicationController
  # user_bookings POST   /users/:user_id/bookings(.:format)
  # new_user_booking GET    /users/:user_id/bookings/new(.:format)
  before_action :set_cooker_and_availabilities, only: [:create]

  def show
    @booking = current_user.bookings.find(params[:id])
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
    @booking.amount_cents = 0

    if @booking.save
      @chatroom = Chatroom.create(name: @booking.cooker.first_name, booking: @booking)
      @booking.amount_cents = @booking.cooker.price_cents * @booking.number_of_meals

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @booking.cooker.first_name,
          images: [@booking.cooker.photo],
          amount: @booking.amount_cents,
          currency: 'eur',
          quantity: @booking.number_of_meals
        }],
        success_url: booking_url(@booking),
        cancel_url: new_user_booking_url(@booking)
      )
      @booking.update(checkout_session_id: session.id)
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :number_of_meals, :booker_id, :cooker_id, :amount_cents, :state, :checkout_session_id)
  end

  def cooking_price
    if params[:amount_cents].exist?
      c = Booking.where('amount = ?', params[:amount_cents]).first
    end
    return c.path
  end

  def set_cooker_and_availabilities
    @cooker = User.find(params[:user_id])
    @availabilities = Availability.where(user: @cooker)
  end
end
