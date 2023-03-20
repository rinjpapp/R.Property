class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    case @user.status_id
    when 2
      residents_path
    when 3
      applicants_path
    end
  end

  def after_sign_in_path_for(resource)
    case @user.status_id
    when 2
      residents_path
    when 3
      applicants_path
    end
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:status_id, :nickname])
  end
end
