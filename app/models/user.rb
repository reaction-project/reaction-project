class User < ApplicationRecord
  include Clearance::User

  enum role: [:user, :admin, :ambassador]

  has_many :issues, through: :user_issues
  has_many :user_issues

  has_one :profile, dependent: :destroy

  after_create UserCallbacks.new
end
