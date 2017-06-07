class CiphersController < ApplicationController
#before_action :authenticate_user!
  #API
  def api
    @cipher = Cipher.find(params[:id])
    @user = User.find(@cipher.user_id)
    puts @user.nom
    respond_to do |format|
      format.html 
      format.json { render json: @cipher.cipher_hash }
    end
  end

end
