class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.where("is_active = true").order(:user_name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user.updated_by = current_user.user_name
  end
  
  def pass
    @user.updated_by = current_user.user_name
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    log_activity(@user.id, @user.user_name, request.env['REMOTE_ADDR'], 'na', 'na', 'User created', false, false)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.updated_by = current_user.user_name
    log_activity(@user.id, @user.user_name, request.env['REMOTE_ADDR'], 'na', 'na', 'User updated', false, false)

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def set_token
    @user = current_user
    @user.updated_by = current_user.user_name
    @user.authentication_token = (BCrypt::Password.create(current_user.user_name+Time.now.to_i.to_s)).last(30)
    @user.api_token_count = Parameter.select("value").where("code=?",'TOKEN_COUNT')
#    @user.api_token_validity = Time.now + Parameter.select("value").where("code=?",'TOKEN_DAYS')
    log_activity(@user.id, @user.user_name, request.env['REMOTE_ADDR'], 'na', 'na', 'User token created', false, false)

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Token was successfully renewed.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.is_active = false
    @user.updated_by = current_user.user_name
    @user.save
    log_activity(@user.id, @user.user_name, request.env['REMOTE_ADDR'], 'na', 'na', 'User inactivated', false, false)

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully inactivated.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :first_name, :user_name, :group_id, :role_id, :email, :language, :section,
                                   :api_token_count, :api_token_validity, :password, :password_confirmation)
    end
end
