class PersonalityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def index?
    true
  end

  def create?
    true # to be updated once Partner is added to user model
  end

  def update?
    record_owner?
  end


  private

  def record_owner?
    record.user == user
  end
end
