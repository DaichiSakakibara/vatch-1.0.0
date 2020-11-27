class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :veg_id, :vatch_id, :sex_id, :blood_type_id, :prefecture_id, :birth_day ])
  end

end