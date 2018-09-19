class ApplicationController < ActionController::API
  respond_to: JSON
  include ActionController::MimeResponds
end
