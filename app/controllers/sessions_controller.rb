class SessionsController < ApplicationController
  include SongsHelper

  def new
    logger.debug "creating a new session"
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      logger.debug "New User logging  in: #{@current_user}"
      session[:user_id] = user.id
      session[:user] = user
      user_songs
      redirect_to songs_path
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    logger.debug "logging out: #{session[:user_id]}"
    session[:user] = nil
    session[:user_id] = nil
    render 'new'
  end
end
