class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authentiate_either_user
  def authentiate_either_user
  	# authenticate_dietitian! || authenticate_client!

  if dietitian_signed_in?
    true
  else
    authenticate_client!
  end
end
end
