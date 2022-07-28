class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all, public: true

    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :manage, Post.includes(:user), user: user
    can :manage, Comment, user: user

    return unless user.role == 'admin' # additional permissions for administrators

    can :manage, :all
  end
end
