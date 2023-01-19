class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.customer?

    can :read, Appointment, user_id: user.id
    can :manage, :all
  end
end
