class ApplicationController < ActionController::API
  include ActionController::Serialization
  acts_as_token_authentication_handler_for User, fallback: :none
end
