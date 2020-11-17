class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
    @user_bookings = Booking.where(user: current_user)
    @user_availabilities = Availability.where(user: current_user)
  end

  private

  def change_role
    current_user.is_a_cook =! current_user.is_a_cook
    current_user.save
    redirect_to profile_path(current_user)
  end
end
