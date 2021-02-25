class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    if session[:student_id]
      @current_user ||= Student.find(session[:student_id])
    else
      @current_user = nil
    end
  end
end
