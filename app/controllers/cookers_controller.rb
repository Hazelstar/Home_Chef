class CookersController < ApplicationController

  def index
    @cookers = User.where(is_a_cook: true)
  end

  def show
    @cooker = User.find(params[:id][:is_a_cook])
  end

  private

  def cooker_params
    params.require
  end

end