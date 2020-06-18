class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   added_attrs = [:nickname, :age_id, :profession_id, :gender_id, :profile, :situation, :country, :experience_country, :duration]
    
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
  #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end
end
