class ReservationsController < ApplicationController
    before_action :authorized

    def index
        @reservations = Reservation.all
    end

    def show

    end

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation.create(reservation_params)
    end

    private
    def reservation_params
    params.require(:reservation).permit(:user_id, :cat_id, :date)
    end

end
