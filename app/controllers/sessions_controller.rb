class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    redirect_to '/'
  end
end
