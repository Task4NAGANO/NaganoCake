class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?

  before_action :authenticate_admin!, if: :admin_url
  def admin_url
    request.fullpath.include?("/admin")
  end

  def after_sign_in_path_for(resource)
    about_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end



  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end
end
