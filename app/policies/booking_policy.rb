class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def show?
    return true
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  def edit?
    return update?
  end

  def update?
    user.admin? || record.user == user || record.experience.user == user
    # record: the experience passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def status?
    record.experience.user == user || user.admin?
  end

  def destroy?
    user.admin? || record.user == user
  end

end
