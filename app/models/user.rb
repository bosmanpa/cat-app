class User < ApplicationRecord
has_many :cats, foreign_key: 'owner_id'
has_many :owner_reservations, through: :cats, source: :reservations
has_many :reservations, foreign_key: 'renter_id' #called this 'reservations' instead of 'renter_reservations'
has_many :rented_cats, through: :reservations, source: :cat

has_secure_password

  def top_3_cats #top 3 highest rated cats. If no cats, returns nil
   cats.length > 0 ? cats.sort_by{|cat| cat.overall_rating}.reverse[0..2] : nil
  end


  def self_reviews_as_renter #Reviews of user as the renter
    Review.select{|r| r.reservation.renter_id == self.id}.map{|r| {reviewer: r.reservation.cat.owner, review: r.owner_review, rating: r.owner_rating}}
  end

  def written_reviews
    #collection of reviews written by user as the renter
    revs_as_renter = Review.select{|r| r.reservation.renter_id == self.id}.map{|r| {reviewee: r.reservation.cat.owner, review: r.renter_review, rating: r.renter_rating}}
    #collection of reviews by user as the owner
    revs_as_owner = Review.select{|r| r.reservation.cat.owner_id == self.id}.map{|r| {reviewee: r.reservation.renter, review: r.owner_review, rating: r.owner_rating}}
    revs_as_owner + revs_as_renter
  end


end
