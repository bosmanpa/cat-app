class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def already_signed_in?
    redirect_to my_profile_path unless !session[:user_id]
  end
end
