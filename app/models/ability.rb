# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.super_admin?
      can :manage, :all
    elsif user.admin?
      can :read, :all
      can :create, :appointments
    elsif user.customer?
      can :read, Appointment, user_id: user.id
      can :create, :all
      can :destroy, :all
    end
  end
end
