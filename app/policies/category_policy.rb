class CategoryPolicy
  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
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
