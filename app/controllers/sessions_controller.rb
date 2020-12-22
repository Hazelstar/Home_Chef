class SessionsController < Devise::SessionsController
  # DELETE /resource
  # def destroy
  #   super
  # end

  private

  def after_sign_in_path_for(resource)
    session[:previous_url] || profile_path
  end
end
