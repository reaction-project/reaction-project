class UserCallbacks
  def after_create(user)
    user.create_profile
  end
end
