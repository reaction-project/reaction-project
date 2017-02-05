class Category < ApplicationRecord
  include CategoryIconUploader::Attachment.new(:icon)

  validates :name, presence: true
end
