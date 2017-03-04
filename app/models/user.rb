class User < ApplicationRecord
  include Clearance::User

  enum role: [:user, :admin]
  has_many :issues, through: :user_issues
  has_many :user_issues

  has_one :profile

  after_create :create_profile
end
