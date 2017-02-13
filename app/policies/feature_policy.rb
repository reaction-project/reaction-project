class FeaturePolicy
  attr_reader :user, :feature

  def initialize(user, feature)
    @user = user
    @feature = feature
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
