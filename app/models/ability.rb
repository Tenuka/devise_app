class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.user?
      can :manage, Book, user_id: user.id
      
      can :read, User
      can :update, User, id: user.id
      can :manage, Chapter, Chapter do |chapter| 
        chapter.book.user_id == user.id
      end
      can :read, Genre
      can [:read, :create], Tag
      # can :read, :all
    else
      can :read, Book
      can :read, Chapter
      can :read, Genre
      can :read, Tag
      # TODO for guest
    end
  end
end
