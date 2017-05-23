class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      cannot :read, User
      cannot :read, Diagnostic
      cannot :read, Clinic
      cannot :read, Specialty
      can :manage, Patient
    end
  end
end
