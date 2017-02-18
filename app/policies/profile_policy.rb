class ProfilePolicy
  attr_reader :user, :profile

  def initialize(user, profile)
    @user = user
    @profile = profile
  end

  def create?
    false
  end

  def destroy?
    false
  end

  def edit?
    return unless user.present?
    user == profile.user
  end

  def index?
    true
  end

  def new?
    false
  end

  def show?
    true
  end

  def update?
    return unless user.present?
    user == profile.user
  end
end
