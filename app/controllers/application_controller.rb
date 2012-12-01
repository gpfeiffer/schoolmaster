class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied."
    redirect_to root_url
  end
end
