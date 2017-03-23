class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
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
