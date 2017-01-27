class Issue < ApplicationRecord
  include IssueIconUploader::Attachment.new(:icon)

  validates :name, presence: true
end
