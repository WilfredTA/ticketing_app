class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to do that"
      redirect_to login_url
    end
  end
end
