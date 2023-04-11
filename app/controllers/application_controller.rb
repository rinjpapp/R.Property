class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    case @user.status_id
    when 2
      user_residents_path(@user.id)
    when 3
      user_applicants_path(@user.id)
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      root_path
    when User
      case @user.status_id
      when 2
        user_residents_path(@user.id)
      when 3
        user_applicants_path(@user.id)
      end
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
