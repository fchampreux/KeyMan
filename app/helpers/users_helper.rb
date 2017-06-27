module UsersHelper
    
    def user_is_admin?
        if user_signed_in? then current_user.is_admin else false end    
    end
    
    def users_list(group)
        User.where("group_id = ?", group)
    end
end
