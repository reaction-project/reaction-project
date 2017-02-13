class Action < ApplicationRecord
  include ActionImageUploader::Attachment.new(:image)

  belongs_to :issue
  belongs_to :category
  has_one :feature, dependent: :destroy

  enum priority: { do_it: 0, urgent: 1, do_or_die: 2 }

  validates :title, presence: true
end
