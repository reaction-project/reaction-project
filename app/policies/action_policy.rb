class ActionPolicy
  attr_reader :user, :action

  def initialize(user, action)
    @user = user
    @action = action
  end

  def create?
    return unless user.present?
    user.admin?
  end

  def destroy?
    return unless user.present?
    user.admin?
  end

  def edit?
    return unless user.present?
    user.admin?
  end

  def index?
    true
  end

  def new?
    return unless user.present?
    user.admin?
  end

  def show?
    true
  end

  def update?
    return unless user.present?
    user.admin?
  end
end
