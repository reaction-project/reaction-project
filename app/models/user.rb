class User < ApplicationRecord
  include Clearance::User

  enum role: [:user, :admin]

  has_one :profile

  after_create :create_profile
end
