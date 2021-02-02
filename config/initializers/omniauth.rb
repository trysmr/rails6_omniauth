class OmniAuth::Strategies::MyDeveloper < OmniAuth::Strategies::Developer
  option :name, 'my_developer'

  def other_phase
    call_app!
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :my_developer

  on_failure do |env|
    if Rails.env.development?
      OmniAuth::FailureEndpoint.call(env)
    else
      SessionsController.action(:failure).call(env)
    end
  end

  OmniAuth.config.logger = Rails.logger
end
