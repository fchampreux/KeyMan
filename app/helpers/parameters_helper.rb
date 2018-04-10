module ParametersHelper
  
    def get_roles_list
        roles_list = Parameter.select("id, name").where("is_active=true and list_name=?",'Roles')
    end

    def get_initial_roles_list
        roles_list = Parameter.select("id, name").where("id=?",'0')
    end
 
    def get_parameters_lists
        lists_list = Parameter.select("id, name").where("list_name=?",'All lists')
    end
    
    def get_sections_list
        sections_list = Parameter.select("id, name").where("list_name=?",'Sections')
    end
    
    def get_keysizes_list
        keysizes_list = Parameter.select("id, name").where("list_name=?",'Key Sizes')
    end

end
