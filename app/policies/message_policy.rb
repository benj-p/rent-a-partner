class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(recipient: user)
    end
  end

  def show?
    user == record.recipient || user == record.sender
  end
end
