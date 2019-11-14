class SessionsController < ApplicationController
  layout :layout
  before_action :already_signed_in?, only: :new


  def new
    render :layout => false
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to my_profile_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def layout
    session[:user_id] ? "application_layout" : "account_menu"

  end
end