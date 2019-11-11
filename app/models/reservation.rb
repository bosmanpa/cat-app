class Reservation < ApplicationRecord
    belongs_to :renter, class_name: 'User'
    belongs_to :cat
    has_one :review
end
