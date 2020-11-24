class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:address, :phone_number, :bio, :last_name, :first_name, :password, :email, :is_a_cook, :price, :photo])
  end

  def default_url_options
    { host: ENV["www.the-home-chef.com"] || "localhost:3000" }
  end
end
