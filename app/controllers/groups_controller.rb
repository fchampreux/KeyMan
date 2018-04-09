class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.created_by = current_user.user_name
    @group.updated_by = current_user.user_name
    @group.keys.each { |k| k.created_by = current_user.user_name }
    @group.keys.each { |k| k.updated_by = current_user.user_name}
    log_activity(@group.id, @group.name, request.env['REMOTE_ADDR'], 'na', 'na', 'Group created', false, false)


    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
def update
   @group.updated_by = current_user.user_name
   @group.keys.each { |k| k.updated_by = current_user.user_name}
   log_activity(@group.id, @group.name, request.env['REMOTE_ADDR'], 'na', 'na', 'Group updated', false, false)
   respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.is_active = false
   log_activity(@group.id, @group.name, request.env['REMOTE_ADDR'], 'na', 'na', 'Group updated', false, false)
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :code, :description, keys_attributes:[:user_id, :name, :description, :valid_from, :valid_until, :id])
    end
end
