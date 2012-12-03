class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied."
    redirect_to root_url
  end

  #  test.  redirect after login.
  def after_sign_in_path_for(user)
    if user.academic
      academic_path(user.academic)
    else
      root_path
    end
  end
end
