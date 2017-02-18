class Profile < ApplicationRecord
  include ProfileAvatarUploader::Attachment.new(:avatar)

  belongs_to :user

  def full_name
    return unless first_name? || last_name?
    [first_name, last_name].compact.join ' '
  end
end
