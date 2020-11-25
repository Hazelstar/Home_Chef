class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
    # @cooker = User.where(cooker: current_user)
    # @cooker = User.find(params[:user]['cooker_id'].to_i)

    @user_bookings = Booking.where(user: current_user)
    @cooker_bookings = Booking.where(cooker: current_user)
    @user_availabilities = Availability.where(user: current_user) if current_user.is_a_cook?

    @user_messages = Message.where(user: current_user)
  end

  private

  def update_profile
    redirect_to action: 'profile'
  end

  def change_role
    current_user.is_a_cook =! current_user.is_a_cook
    current_user.save
    redirect_to profile_path(current_user)
  end
end
