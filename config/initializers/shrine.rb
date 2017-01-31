s3_enabled = %w(
  AWS_S3_BUCKET_NAME
  AWS_ACCESS_KEY_ID
  AWS_REGION
  AWS_SECRET_ACCESS_KEY
).all? { |key| ENV.key? key }

if s3_enabled
  require 'shrine/storage/s3'

  s3_options = {
    access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    region:            ENV.fetch('AWS_REGION'),
    bucket:            ENV.fetch('AWS_S3_BUCKET_NAME'),
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options),
  }
else
  # Fall back to file storage
  require 'shrine'
  require 'shrine/storage/file_system'

  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'),
  }
end

Shrine.plugin :activerecord
# Shrine.plugin :backgrounding
Shrine.plugin :cached_attachment_data
Shrine.plugin :default_url
Shrine.plugin :direct_upload
Shrine.plugin :logging

# Shrine::Attacher.promote { |data| PromoteJob.perform_async(data) }
# Shrine::Attacher.delete { |data| DeleteJob.perform_async(data) }
