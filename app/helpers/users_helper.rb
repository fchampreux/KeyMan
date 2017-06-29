module UsersHelper
    
    def user_is_admin?
        if user_signed_in? then current_user.is_admin else false end    
    end
    
    def user_ciphers_list(cipher)
        Cipher.where("user_id = ?", cipher)
    end
end
