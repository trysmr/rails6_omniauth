Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer

  OmniAuth.config.logger = Rails.logger
end
