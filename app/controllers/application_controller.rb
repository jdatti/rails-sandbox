class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :user_signed_in?, :user_signed_out?
 
  def current_user
    logger.debug "current user in session: #{@current_user}"
    if session[:user_id]
      logger.debug "current user - #{@current_user}, session user id - #{session[:user_id]}"
      @current_user ||= User.find(session[:user_id])
    end
    @current_user
  end
 
  def user_signed_in?
    logger.debug "checking for signed in user #{current_user}"
    return true unless current_user == nil
  end
 
  def user_signed_out?
    !user_signed_in?
  end
end
