class PhotosController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    #     # and because the user "has_many :availabilities"
    # @availability = @user[:availability_id]
    @photos = @user.photos

  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @user = current_user
  end

  def create
    @photo = Photo.new(photos_params)
    @photo.user = current_user

    if @photo.save
      flash[:notice] = "New pictures added!"
      redirect_to profile_path(current_user)
    else
      flash[:error] = "Error adding availability"
      render :new
    end
  end

  def destroy
    @photo = Availability.find(params[:id])
    @photo.destroy
    redirect_to user_photos_path(current_user)
  end

  private

  def photos_params
    params.require(:photo).permit(:title, :photo)
  end
end
