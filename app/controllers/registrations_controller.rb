# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  after_action :update_cook, only: [:update]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  def update_cook
    resource.is_a_cook = params[:user][:is_a_cook]
    resource.save
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
   devise_parameter_sanitizer.permit(:account_update, keys: [:address, :phone_number, :bio, :last_name, :first_name, :password, :email, :is_a_cook, :price])
  end

  def after_sign_up_path_for(resource)
    "/profile"
  end

  def after_sign_in_path_for(resource)
    profile_path
  end

  def after_update_path_for(resource)
    profile_path
  end

  # def after_inactive_sign_up_path_for(resource)
  #   "/profile"
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
