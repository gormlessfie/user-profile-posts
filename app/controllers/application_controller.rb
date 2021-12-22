class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def logged_in?
    !!session[:current_user_id]
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in to access this section.'
      redirect_to users_path
    end
  end
end
