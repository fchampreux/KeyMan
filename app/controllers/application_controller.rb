class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #  include SessionsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  acts_as_token_authentication_handler_for User

  # Security note: controllers with no-CSRF protection must disable the Devise fallback,
  # see #49 for details.
  # acts_as_token_authentication_handler_for User, fallback: :none

  # The token authentication requirement can target specific controller actions:
  # acts_as_token_authentication_handler_for User, only: [:create, :update, :destroy]
  # acts_as_token_authentication_handler_for User, except: [:index, :show]
  #
  # Or target specific controller conditions:
  # acts_as_token_authentication_handler_for User, unless: lambda { |controller| controller.request.format.html? }
  # acts_as_token_authentication_handler_for User, if: lambda { |controller| controller.request.format.json? }

  # Several token authenticatable models can be handled by the same controller.
  # If so, for all of them except the last, the fallback should be set to :none.
  #
  # Please do notice that the order of declaration defines the order of precedence.
  #
  # acts_as_token_authentication_handler_for Admin, fallback: :none
  # acts_as_token_authentication_handler_for SpecialUser, fallback: :none
  # acts_as_token_authentication_handler_for User # the last fallback is up to you

  # Aliases can be defined for namespaced models:
  #
  # acts_as_token_authentication_handler_for Customer::Representative, as: :facilitator
  # acts_as_token_authentication_handler_for SpecialUser, as: :user
  #
  # When defined, aliases are used to define both the params and the header names to watch.
  # E.g. facilitator_token, X-Facilitator-Token
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  protected
  def configure_permitted_parameters
    added_attrs = [:email, :name, :first_name, :group_id, :role_id, :is_admin, :language, :user_name, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
end
