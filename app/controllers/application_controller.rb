class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #  include SessionsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  
# Audit trail recording function
    def log_activity(objectId, objectName, server, table, column, description, encrypt, decrypt)
        @trail = AuditTrail.new
        @trail.user = current_user
        @trail.action = action_name
        @trail.object_id = objectId || 0
        @trail.object_class = controller_name
        @trail.object_name = objectName
        @trail.server_name = server
        @trail.table_name = table
        @trail.column_name = column
        @trail.description = description
        @trail.used_encrypt = encrypt
        @trail.used_decrypt = decrypt
        @trail.created_by = current_user.user_name
        @trail.save
    end
   
# Cancan notification   
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  
# Set 404 error code when record not found
def not_found
  raise ActiveRecord::RecordNotFound.new('Not Found')
end

# Set 401 error code when access denied
def permission_denied
  raise CanCan::AccessDenied
end

# Devise permitted parameters
  protected
  def configure_permitted_parameters
    added_attrs = [:email, :name, :first_name, :group_id, :role_id, :is_admin, :language, :user_name, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
end
