class CookersController < ApplicationController
  before_action :set_counter, only: [:show]
  skip_before_action :authenticate_user!, only: [:index]

  # def index
  #   @cookers = User.where(is_a_cook: 'true')

  #   respond_to do |format|
  #     format.html
  #     format.json { render json: { cookers: @cookers } }
  #   end
  # end

  # index with search bar
  def index
    @cookers = User.where(is_a_cook: 'true')
    if params[:query].present?
      @cookers = User.where(first_name: params[:query])
    end

  end


  def show
    @cooker = User.find(params[:id])
    @availabilities = Availability.where(user: @cooker)

    @booking = Booking.new
  end

  private

  def cooker_params
    params.require
  end

  def set_counter
    @cooker_count = User.where(is_a_cook: 'true').count
  end
end
