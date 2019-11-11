class User < ApplicationRecord
has_many :cats, foreign_key: 'owner_id'
has_many :owner_reservations, through: :cats, source: :reservations
has_many :renter_reservations, foreign_key: 'renter_id', class_name: 'Reservations'
has_many :rented_cats, through: :reservations, source: :cats
end
