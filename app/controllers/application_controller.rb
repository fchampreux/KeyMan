class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #  include SessionsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added_attrs = [:email, :name, :first_name, :group_id, :is_admin, :language, :user_name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
end
