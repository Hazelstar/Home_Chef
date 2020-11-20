class AvailabilitiesController < ApplicationController
  # before_create :set_foo_to_now, only: :create

  def index
    @user = User.find(params[:user_id])
    #     # and because the user "has_many :availabilities"
    # @availability = @user[:availability_id]
    @availabilities = @user.availabilities

    
  end

  def new
    @availability = Availability.new
    @user = current_user
  end

  def create
    # @user = current_user
    @availability = Availability.new(availabilities_params)
    @availability.user = current_user

    if @availability.save
      flash[:notice] = "New availability added!"
      redirect_to user_availabilities_path(current_user.id)
    else
      flash[:error] = "Error adding availability"
      render :new
    end
  end

  # def edit
  #   @availability = Availability.find(params[:id])
  # end

  # def update
  #   @availability = Availability.find(params[:id])

  #   if @availability.update_attributes(availabilities_params)
  #     flash[:notice] = "Your availability is updated!"
  #     redirect_to user_availabilities_path(current_user.id)
  #   else
  #     flash[:error] = "Error updating availability"
  #     render :index
  #   end
  # end

  def destroy
    # @user = User.find(params[:user_id])
    # @availability = @user.availabilities
    # @availability.destroy
    @availability = Availability.find(params[:id])
    @availability.destroy
    redirect_to user_availabilities_path(current_user)
  end

  private

  def availabilities_params
    params.require(:availability).permit(:event_date, :start_hour, :end_hour)
  end

  # def end_date_after_start_date
  #   return if end_date.blank? || start_date.blank?

  #   if end_date < start_date
  #     errors.add(:end_date, "must be after the start date")
  #   end
  # end

  def check_access
    redirect_to root_path and return unless current_user.is_a_cook
  end
end
