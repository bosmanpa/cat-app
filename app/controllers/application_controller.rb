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
    if !logged_in?
    flash[:errors] = ["You must be logged in to do that!"]
    redirect_to login_path
    end
  end

  def already_signed_in?
    redirect_to my_profile_path unless !session[:user_id]
  end
end
