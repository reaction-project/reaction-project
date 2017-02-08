class Action < ApplicationRecord
  include ActionImageUploader::Attachment.new(:image)

  belongs_to :issue
  belongs_to :category

  enum priority: { do_it: 0, urgent: 1, do_or_die: 2 }

  validates :title, presence: true
end
