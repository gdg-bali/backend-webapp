# frozen_string_literal: true

Rails.application.config.middleware.use Rack::Cors do
  allow do
    # For production, replace the
    # asterisk with the URL of the client-side application
    origins '*'
    resource '*',
             headers: :any,
             expose: %w[access-token expiry token-type uid client],
             methods: %i[get post options delete put]
  end
end