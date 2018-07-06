class AuditTrailsController < ApplicationController
  before_action :authenticate_user!

  # GET /audits
  # GET /audits.json
  def index
    @audit_trails = AuditTrail.order(id: :desc).limit(50).paginate(page: params[:page], per_page: 10)
  end

end
