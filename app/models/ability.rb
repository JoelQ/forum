class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:admin)
      can :manage, :all
    end

    if user.has_role?(:user)
      can :read, Category do |category|
        !CategoryRole.category_banned_for_user?(category, user)
      end
      can :read, [Topic, Post]
      can :create, [Topic, Post]
      can :update, [Topic, Post], user_id: user.id
    end

    if user.has_role?(:guest)
      can :read, Category
    end
  end
end
