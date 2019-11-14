class ReservationsController < ApplicationController
    before_action :authorized
    before_action :find_reservation, only: [:show, :edit, :update, :destroy]


    def index
        @reservations = Reservation.all.sort_by{ |r| r.date}
    end

    def show
    end

    def new
        @reservation = Reservation.new
        @cat_id = params[:id]
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.renter_id = session[:user_id]
        if @reservation.save
            redirect_to @reservation
        else
            flash[:errors] = @reservation.errors.full_messages
            redirect_to new_reservation_path(params[:reservation][:cat_id])
        end
    end

    def edit
        if session[:user_id] == @reservation.renter_id
          render :edit
        else
          flash[:errors] = []
          redirect_to @reservation
        end
    end

    def update
        if @reservation.update(reservation_params)
            redirect_to @reservation
        else
            flash[:errors] = @reservation.errors.full_messages
            redirect_to edit_reservation_path(@reservation)
        end
    end

    def destroy
        @reservation.delete
        redirect_to my_profile_path
    end

    private
    def find_reservation
        @reservation = Reservation.find_by(id: params[:id])
    end

    def reservation_params
        params.require(:reservation).permit(:cat_id, :date)
    end

end
