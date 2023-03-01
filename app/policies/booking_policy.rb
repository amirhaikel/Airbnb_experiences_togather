class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    return create?
  end

  def show?
    user.admin? || record.user == user
  end

  def create?
    return true
  end

  def edit?
    return update?
  end

  def update?
    user.admin? || record.user == user
    # record: the booking passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end


  def destroy?
    user.admin? || record.user == user
  end

end
