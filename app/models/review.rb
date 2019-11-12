class Review < ApplicationRecord
    belongs_to :reservation
    #user_review is the review WRITTEN BY USER
    #renter_review is the review WRITTEN BY RENTER
end
