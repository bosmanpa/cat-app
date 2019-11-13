class RenterReview < ApplicationRecord
  belongs_to :reservation
  validates :reservation_id, uniqueness: {message: "already has a review!"} 
end