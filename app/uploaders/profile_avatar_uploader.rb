class ProfileAvatarUploader < Shrine
  plugin :activerecord
  plugin :determine_mime_type
  plugin :default_url
  plugin :logging, logger: Rails.logger
  plugin :remove_attachment
  plugin :store_dimensions
  plugin :validation_helpers

  plugin :direct_upload, max_size: 5.megabytes, presign: lambda { |_request|
    { content_length_range: 0..5.megabytes }
  }

  Attacher.validate do
    validate_extension_inclusion [/jpe?g/, 'png', 'gif', 'svg']
    validate_mime_type_inclusion [
      'image/jpeg', 'image/png', 'image/gif', 'image/svg+xml'
    ]
    validate_max_size 5.megabytes
    validate_min_size 10.kilobytes
    validate_max_width 5760
    validate_max_height 5760
  end

  Attacher.default_url do |_options|
    "#{record.class.name.pluralize.underscore.dasherize}/#{name}/missing.png"
  end
end
