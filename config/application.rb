require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ReactionProject
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.active_record.primary_key = :uuid

    config.generators do |g|
        g.orm :active_record,
              primary_key_type: :uuid,
              generate_method: 'uuid_generate_v4()'
    end
  end
end
