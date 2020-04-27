class ApplicationController < ActionController::Base
  helper_method :current_enrollment

  def set_current_enrollment(enrollment)
    session[:enrollment_id] = enrollment.id
    @enrollment = enrollment
  end

  def current_enrollment
    @enrollment ||= Enrollment.find(session[:enrollment_id])
  end
end
