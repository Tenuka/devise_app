class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.user?
      can :manage, Book, user_id: user.id
      # can :read, :all
    else
      # TODO for guest
    end
  end
end
