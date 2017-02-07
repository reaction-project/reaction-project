class IssueIconUploader < Shrine
  plugin :activerecord
  plugin :determine_mime_type
  plugin :logging, logger: Rails.logger
  plugin :remove_attachment
  plugin :store_dimensions
  plugin :validation_helpers

  plugin :direct_upload, max_size: 2.megabytes, presign: lambda { |_request|
    { content_length_range: 0..2.megabytes }
  }

  Attacher.validate do
    validate_mime_type_inclusion ['image/png', 'image/gif', 'image/svg+xml']
    validate_max_size 2.megabytes
    validate_min_size 5.kilobytes
    validate_max_width 1200
    validate_max_height 1200
  end

  Attacher.default_url do |_options|
    "/#{record.pluralize.underscore.dasherize}/#{name}/missing.svg"
  end
end
