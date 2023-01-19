class Ability
  include CanCan::Ability

  def initialize(user)
    if user.customer?
      can :read, Appointment, user_id: user.id
      can :manage, :all
    end
  end
end
