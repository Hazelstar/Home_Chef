class CookersController < ApplicationController
  before_action :set_counter, only: [:show]
  skip_before_action :authenticate_user!, only: [:index]

  # index with search bar
  def index
    @cookers = User.where(is_a_cook: 'true')

    if params[:query].present?
      @cookers = User.where(is_a_cook: 'true').search(params[:query])

      if params[:min_price].present? && params[:max_price].present?
        @cookers = @cookers.where("price >= ? and price <= ?", params[:min_price].to_i, params[:max_price].to_i)
      elsif params[:min_price].present?
        @cookers = @cookers.where("price >= ?", params[:min_price].to_i)
      elsif params[:max_price].present?
        @cookers = @cookers.where("price <= ?", params[:max_price].to_i)
      end

    else
      if params[:min_price].present? && params[:max_price].present?
        @cookers = @cookers.where("price >= ? and price <= ?", params[:min_price].to_i, params[:max_price].to_i)
      elsif params[:min_price].present?
        @cookers = @cookers.where("price >= ?", params[:min_price].to_i)
      elsif params[:max_price].present?
        @cookers = @cookers.where("price <= ?", params[:max_price].to_i)
      end

    end
  end

  def show
    @cooker = User.find(params[:id])
    @availabilities = Availability.where(user: @cooker)

    # create new booking and set price to be the xactual cooker's feee * number of meals requested.
    @booking = Booking.new(price_cents: @cooker.price)
  end

  private

  def cooker_params
    params.require
  end

  def set_counter
    @cooker_count = User.where(is_a_cook: 'true').count
  end
end
