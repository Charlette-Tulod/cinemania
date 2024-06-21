class ApplicationController < ActionController::Base
  include AuthenticateHelper

  before_action :authenticate_user
end
