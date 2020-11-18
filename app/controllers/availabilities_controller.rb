class AvailabilitiesController < ApplicationController
  # before_filter :check_access
  # before_create :set_foo_to_now, only: :create

  def show
    @user = User.find(params[:user_id])
        # and because the user "has_many :availabilities"
    @availability = @user.availabilities.all
    @availability.user = current_user
  end

  def new
    @availability = Availability.new
    @user = current_user
  end

  def create
    @user = current_user
    @availability = Availability.new(availabilities_params)
    @availability.user = current_user


    if @availability.save
      flash[:notice] = "New availability added!"
      redirect_to user_availability_path(@user.id, @availability.id)
    else
      flash[:error] = "Error adding availability"
      render :new
    end
  end

  def edit
    @availability = Availability.find(params[:id])
  end

  def update
    @availability = Availability.find(params[:id])

    if @availability.update_attributes(availabilities_params)
      flash[:notice] = "Your availability is updated!"
      redirect_to user_availability_path
    else
      flash[:error] = "Error updating availability"
      render :show
    end
  end

  private

  # def cooker
  #   @cooker = current_user
  # end

  def availabilities_params
    params.require(:availability).permit(:start_date, :end_date, :user_id)
  end

  # def end_date_after_start_date
  #   return if end_date.blank? || start_date.blank?

  #   if end_date < start_date
  #     errors.add(:end_date, "must be after the start date")
  #   end
  # end

  def set_foo_to_now
    self.foo = Datetime.now
  end

  def check_access
    redirect_to root_path and return unless current_user.is_a_cook
  end
end
