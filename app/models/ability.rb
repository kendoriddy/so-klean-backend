class Ability
  include CanCan::Ability

  def initialize(user)
    if user.super_admin? || user.admin?
      can :manage, :all
    elsif user.customer?
      can :read, Appointment, user_id: user.id
      can :create, :all
      can :destroy, :all
    end
  end
end
