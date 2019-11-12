class ReservationsController < ApplicationController

    def index
        @reservations = Reservation.all
    end

    def show
        
    end

    def new
        @reservation = Reservation.new
    end

end
