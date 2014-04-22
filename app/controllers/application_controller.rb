class ApplicationController < ActionController::Base
  protect_from_forgery

#  before_filter :store_location
  before_filter :authenticate_user!

  ##  uncomment to check authorization setup ...
  #check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied."
    redirect_to root_url
  end

  # def store_location
  #   # store last url as long as it isn't a /users path
  #   url = request.fullpath
  #   session[:previous_url] = url unless url =~ /\/users/
  # end

  # def after_sign_in_path_for(resource)
  #   session[:previous_url] || root_path
  # end

  #  test.  redirect after login.
  def after_sign_in_path_for(user)
    if user.academic
      academic_path(user.academic)
    elsif user.enroled?
      enrolment_path(user.enrolment)
    else
      root_path
    end
  end
end
