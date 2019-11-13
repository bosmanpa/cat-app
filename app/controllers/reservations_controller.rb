class ReservationsController < ApplicationController
    before_action :authorized

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

    private
    def reservation_params
    params.require(:reservation).permit(:cat_id, :date)
    end

end
