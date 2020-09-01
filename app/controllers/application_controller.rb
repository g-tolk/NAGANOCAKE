
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    if resource == Admin
      root_path
    elsif resource == Member
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == Admin
      root_path
    elsif resource == Member
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :kana_family_name, :kana_first_name, :email, :telephone_number, :postal_code, :address])
  end
end

