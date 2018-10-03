Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
    ENV['GOOGLE_APP_ID'], 
    ENV['GOOGLE_APP_SECRET'], 
    provider_ignores_state: true,
    access_type: 'offline', prompt: 'consent', scope: 'email,profile,calendar'
end