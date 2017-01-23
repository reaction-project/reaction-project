class User < ApplicationRecord
  include Clearance::User

  enum role: [:user, :admin]
end
