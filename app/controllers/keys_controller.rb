class KeysController < ApplicationController
 before_action :authenticate_user!
 
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

end
