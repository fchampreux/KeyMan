module UsersHelper
    
    def user_is_admin?
        if user_signed_in? then current_user.is_admin else false end    
    end
    
    def data_owners_list
        User.where('role_id = 4') #Data owner
    end
    
    def data_stewards_list
        User.where('role_id = 5') #Data steward
    end
    
    def set_locale
        if signed_in?
          I18n.locale = current_user.language || I18n.default_locale
        else
          I18n.locale = I18n.default_locale
        end
    end
    
    def get_token_lifetime
        token_lifetime = Parameter.select("value").where("code=?",'TOKEN_DAYS').take!
    end
    
    def get_token_count
        token_count = Parameter.select("value").where("code=?",'TOKEN_COUNT').take!
    end

end
