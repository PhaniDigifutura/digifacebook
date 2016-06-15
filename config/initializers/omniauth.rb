OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "485346685003603", "e537d18451cbf0fba340f78b101e928a"
end