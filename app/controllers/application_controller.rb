class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def notify(action, object)

    WebsocketRails[:notifications].trigger action, object.to_json

  end
end
