class Issue < ApplicationRecord
  include IssueIconUploader::Attachment.new(:icon)

  has_many :user_issues
  has_many :users, through: :user_issues

  validates :name, presence: true
end
