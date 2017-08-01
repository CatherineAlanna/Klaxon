class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, Product
      can :manage, User, id: user.id
      can :manage, Order, user_id: user.id
      can [:create, :read], Comment
    end
  end
end
