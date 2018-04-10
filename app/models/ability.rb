class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    
    # Names of roles must match the related parameters codes
    puts user.name
    puts user.role.code
    
    case user.role.code
    when '0' # Application Administrator
      can :manage, Group
      can :manage, User
      can :manage, Parameter

    when '1' # Keys manager aka KeyAdmin or Data Protection Officer (organisation wide)
      can :manage, Group
      can :manage, Key 
      can :read, AccessList 
      can :read, User
      can :read, Parameter

    when '2' # Business manager aka Stat Adminn
      can :manage, Group
      can [:read, :update], Key
      can :read, AccessList 
      can :read, User
      can :read, Parameter

    when '3' # Data Owner aka Stat Owner
      can [:read, :update], Key
      can :manage, AccessList 
      can :read, Group
      can :read, User
      can :read, Parameter
      
    when '4' # Keys user aka Stat Worker or Data Steward
      can :read, Key
      can :read, Group
      can :read, User
      can :read, Parameter
      
    else
      can :read, Group
      
    end
          
  end
end
