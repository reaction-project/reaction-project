class IssueIconUploader < Shrine
  plugin :activerecord
  plugin :determine_mime_type
  plugin :logging, logger: Rails.logger
  plugin :remove_attachment
  plugin :store_dimensions
  plugin :validation_helpers

  Attacher.validate do
    validate_mime_type_inclusion ['image/png', 'image/gif', 'image/svg+xml']
  end
end
