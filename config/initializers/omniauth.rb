class OmniAuth::Strategies::MyDeveloper < OmniAuth::Strategies::Developer
  option :name, 'my_developer'

  def other_phase
    call_app!
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :my_developer

  OmniAuth.config.logger = Rails.logger
end
