class UsersController < ApplicationController
  before_action :authorized, only: [:edit, :destroy]
  
    def new
        @user = User.new
    end

    def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to my_profile_path
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to new_user_path
      end
    end

    def myprofile
      @user = User.find_by(id: session[:user_id])
      @cats = @user.cats
      @reservations = @user.reservations
    end

    def show
      @user = User.find_by(id: params[:id])
      @cats = @user.cats
    end


    private

    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

end
