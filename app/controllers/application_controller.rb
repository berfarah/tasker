class ApplicationController < ActionController::Base
  PER_PAGE = 20.freeze
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
