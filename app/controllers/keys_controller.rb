class KeysController < ApplicationController
  
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
  
  # Authentication testing:
  # curl -H "X-User-Token: 4pQVsGcp_3EnWhacqAU9" -H "X-User-Name: user6" http://localhost:3000/api/1.json
 
  #API
  def api
    @key = Key.find(params[:id])
    @user = User.find(@key.user_id)
    puts @user.user_name
    respond_to do |format|
      format.html 
      format.json { render json: @key.key_hash }
    end
  end
  
  # GET /access_lists/1/edit
  def edit
  end

  # PATCH/PUT /access_lists/1
  # PATCH/PUT /access_lists/1.json
  def update
   @access_list.updated_by = current_user.user_name
   log_activity(@access_list.id, @access_list.name, 'na', 'na', 'na', 'Access List update', false, false)
   respond_to do |format|
      if @access_list.update(access_list_params)
        format.html { redirect_to @access_list, notice: 'Access List was successfully updated.' }
        format.json { render :show, status: :ok, location: @access_list }
      else
        format.html { render :edit }
        format.json { render json: @access_list.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key
      @key = Key.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:key).permit(:name, :code, :description, access_lists_attributes:[:user_id, :allow_encrypt, :allow_encrypt, :valid_from, :valid_until, :_destroy, :id])
    end

end
