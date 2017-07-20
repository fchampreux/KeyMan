module ParametersHelper
    def get_roles_list
        roles_list = Parameter.select("id, name").where("list_name=?",'Roles')
    end
end
